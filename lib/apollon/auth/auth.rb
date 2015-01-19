# encoding: utf-8

require 'json'
require 'pp'
require 'yaml'

# Apollon module
module Apollon
  class Auth
    attr_reader :config, :config_path, :auth_path, :raw

    def initialize(config_path = nil)
      @config_path = config_path || File.join(File.dirname(__FILE__), '..', '..', '..', 'config/auth-config.yml')
      @config = YAML.load_file(@config_path)
      @auth_path = File.expand_path('~/.apollon/auth.json')

      # Load config
      load_config
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

        values.each do |k,v|
          res = v.select { |k,v| v == nil || v.empty? }
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

    def load_config(path = auth_path)
      @raw = Apollon::Auth.load(path)
    end

    def init(init_config = config)
      @raw = Apollon::Auth.init(init_config)
      write # returns raw
    end

    def load(path)
      @raw = Apollon::Auth.load(path)
    end

    def providers
      @raw ||= load_config
    end

    def providers_names
      providers.keys
    end

    def show
      @raw
    end

    def write
      # Generate pretty JSON representation
      Apollon::Auth.write(auth_path, raw)
      raw
    end
  end
end