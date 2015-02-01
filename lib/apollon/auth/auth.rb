# encoding: utf-8

require 'active_support/all'
require 'json'
require 'pp'
require 'yaml'

require_relative '../client/client'

# Apollon module
module Apollon
  # Apollon Auth module
  module Auth
    # Apollon Auth class
    class Auth
      DEFAULT_OPTS = {
        auth_config_settings: File.join(File.dirname(__FILE__), '..', '..', '..', 'config/auth.yml'),
        auth_config: File.join(Apollon::Client::Client.app_data_dir, 'auth.json')
      }

      PROVIDERS = %w(Aws DigitalOcean)

      attr_reader :auth_config, :auth_path, :client, :config, :opts

      def initialize(client, opts = DEFAULT_OPTS)
        @client = client

        @opts = DEFAULT_OPTS.merge(opts)

        @auth_config = YAML.load_file(@opts[:auth_config_settings])
        load_auth_config(@opts[:auth_config])

        # Instances of provider implementations
        create_providers
      end

      class << self
        def init(config)
          values = {}
          config.each do |provider, settings|
            values[provider] = {}

            settings['fields'].each do |field|
              print "#{provider} #{field}: "
              values[provider][field] = $stdin.gets.chomp
            end
          end

          values.each do |key, val|
            res = val.select { |_k, v| v.nil? || v.empty? }
            values.delete key if res.length > 0
          end

          values
        end

        def load(path)
          res = {}
          if File.exist?(path)
            content = File.read(path)
            res = JSON.parse(content)
          end
          res
        end

        def write(path, raw)
          # Generate pretty JSON representation
          res = JSON.pretty_generate(raw)

          # Write JSON representation to file in ~/.apollon/auth.json
          File.open(path, 'w') { |file| file.write(res) }

          res
        end
      end

      def init(init_config = auth_config)
        @config = Auth.init(init_config)
        write # returns raw
      end

      def load_auth_config(conf = auth_config)
        @config = Auth.load(conf)
      end

      alias_method :load_config, :load

      def provider(name)
        canonical_name = name.downcase
        @provider_instances[canonical_name]
      end

      def providers
        @provider_instances.values
      end

      def providers_names
        @config.keys
      end

      def write
        # Generate pretty JSON representation
        Auth.write(auth_path, @config)
        @config
      end

      private

      def create_providers(providers_to_create = PROVIDERS)
        @provider_instances = {}
        providers_to_create.each do |name|
          next unless config.include?(name)

          canonical_name = name.downcase
          file_name = name.underscore
          file_path = File.expand_path(File.join(File.dirname(__FILE__), '..', "provider/#{file_name}.rb"))
          require file_path
          class_name = file_name.camelize
          klass = Object.const_get('Apollon').const_get('Provider').const_get(class_name)
          @provider_instances[canonical_name] = klass.new(self)
        end
        @provider_instances
      end
    end
  end
end
