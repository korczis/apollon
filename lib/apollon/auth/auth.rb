# encoding: utf-8

require 'active_support/all'
require 'json'
require 'pp'
require 'yaml'

# Apollon module
module Apollon
  module Auth
    class Auth
      attr_reader :auth_path, :client, :config, :config_path, :dir, :raw

      CONFIG_DIR = File.expand_path('~/.apollon')

      def initialize(client, config_path = nil)
        @dir = File.expand_path(CONFIG_DIR)
        init_dir

        @client = client
        @config_path = config_path || File.join(File.dirname(__FILE__), '..', '..', '..', 'config/auth-config.yml')
        @config = YAML.load_file(@config_path)

        @auth_path = File.join(CONFIG_DIR, 'auth.json')
        load

        # Instances of provider implementations
        @provider_instances = {}
      end

      alias_method :providers, :raw
      alias_method :show, :raw

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

          values.each do |k, v|
            res = v.select { |k, v| v == nil || v.empty? }
            values.delete k if res.length > 0
          end

          values
        end

        def load(path)
          res = {}
          if File.exists?(path)
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

      def init(init_config = config)
        @raw = Auth.init(init_config)
        write # returns raw
      end

      def init_dir
        FileUtils.mkdir_p(dir) unless File.directory?(dir)
      end


      def load(path = auth_path)
        @raw = Auth.load(path)
      end

      alias_method :load_config, :load

      def provider(name)
        canonical_name = name.downcase
        unless @provider_instances.key?(canonical_name)
          file_name = name.underscore
          file_path = File.expand_path(File.join(File.dirname(__FILE__), '..', "provider/#{file_name}.rb"))
          require file_path
          class_name = file_name.camelize
          klass = Object.const_get('Apollon').const_get('Provider').const_get(class_name)
          @provider_instances[canonical_name] = klass.new(self)
        end
        @provider_instances[canonical_name]
      end

      def providers_names
        providers.keys
      end

      def write
        # Generate pretty JSON representation
        Auth.write(auth_path, raw)
        raw
      end
    end
  end
end