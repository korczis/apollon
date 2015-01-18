# encoding: utf-8

require 'json'
require 'pp'
require 'yaml'

# Apollon module
module Apollon
  class Auth
    attr_reader :auth_config, :auth_config_path, :auth_path, :raw

    def initialize
      @auth_config_path = File.join(File.dirname(__FILE__), '..', '..', '..', 'config/auth-config.yml')
      @auth_config = YAML.load_file(@auth_config_path)
      @auth_path = File.expand_path('~/.apollon/auth.json')
      @raw = nil
    end

    class << self
      def init(config)
        values = {}
        config['providers'].each do |provider|
          values[provider['provider']] = {}

          provider['fields'].each do |field|
            provider_name = provider['provider']
            print "#{provider_name} #{field}: "
            values[provider_name][field] = $stdin.gets.chomp
          end
        end
        values
      end

      def load(path)
        res = nil
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
      Apollon::Auth.load(path)
    end

    def init(config = auth_config)
      @raw = Apollon::Auth.init(config)
      write
      raw
    end

    def load(path)
      @raw = Apollon::Auth.load(path)
    end

    def providers
      auth_config['providers']
    end

    def show
      load_config
    end

    def write
      # Generate pretty JSON representation
      Apollon::Auth.write(auth_path, raw)
    end
  end
end