# encoding: UTF-8

require 'pathname'

require_relative '../version'

module Apollon
  # Bootstrapping module
  module Bootstrap
    HOME_DIR = File.expand_path('~')
    APOLLON_DIR = File.join(HOME_DIR, '.apollon')

    class << self
      def app_dir_exists?(dir = APOLLON_DIR)
        File.exists?(dir)
      end

      def bootstrap(dir = APOLLON_DIR)
        puts "Bootstraping Apollon Environment - #{Apollon::VERSION}"

        unless app_dir_exists?(dir)
          create_app_dir(dir)
        end
      end

      def create_app_dir(dir = APOLLON_DIR)
        puts "Creating Apollon application data directory - #{dir}"
        Dir.mkdir(dir)
      end
    end
  end
end
