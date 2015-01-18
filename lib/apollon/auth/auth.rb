# encoding: utf-8

require 'json'
require 'pp'
require 'yaml'

# Apollon module
module Apollon
  class Auth
    attr_reader :auth_config, :auth_config_path, :auth_path

    def initialize
      @auth_config_path = File.join(File.dirname(__FILE__), '..', '..', '..', 'config/auth-config.yml')
      @auth_config = YAML.load_file(@auth_config_path)
      @auth_path = File.expand_path('~/.apollon/auth.json')
    end

    def get
      res = nil
      if File.exists?(auth_path)
        content = File.read(auth_path)
        res = JSON.parse(content)
      end
      res
    end

    def init
      values = {}
      auth_config['providers'].each do |provider|
        values[provider['provider']] = {}

        provider['fields'].each do |field|
          provider_name = provider['provider']
          print "#{provider_name} #{field}: "
          values[provider_name][field] = $stdin.gets.chomp
        end
      end

      # Generate pretty JSON representation
      json = JSON.pretty_generate(values)

      # Show where the config will be written
      puts "Writing authentication configuration to #{auth_path}"

      # Print JSON representation
      puts json

      # Write JSON representation to file in ~/.apollon/auth.json
      File.open(auth_path, 'w') { |file| file.write(json) }

      # Return loaded config values
      values
    end

    def show
      puts JSON.pretty_generate(get)
    end
  end
end