# encoding: UTF-8

require 'pathname'

require_relative '../version'

module Apollon
  # Bootstrapping module
  module Bootstrap
    HOME_DIR = File.expand_path('~')
    APOLLON_DIR = File.join(HOME_DIR, '.apollon')

    class << self
      def bootstrap
        puts "Bootstraping Apollon Environment - #{Apollon::VERSION}"

        create_app_dir
      end

      def create_app_dir(dir = APOLLON_DIR)
        exist = File.exists?(dir)
        unless exist
          puts "Creating Apollon application data directory - #{dir}"
          Dir.mkdir(dir)
        end
      end
    end
  end
end
