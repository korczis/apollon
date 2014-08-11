# encoding: UTF-8

module Apollon
  # Apollon Core module
  module Core
    HOME_DIR = File.expand_path('~')
    APOLLON_DIR = File.join(HOME_DIR, '.apollon')

    class << self
      def app_dir_exists?(dir = BOOTSTRAP_DIR)
        File.exist?(dir)
      end

      def create_app_dir(dir = BOOTSTRAP_DIR)
        puts "Creating Apollon application data directory - #{dir}"
        Dir.mkdir(dir)
      end

      def remove_app_dir(dir = BOOTSTRAP_DIR)
        puts "Removing Apollon application data directory - #{dir}"
        Dir.rmdir(dir)
      end
    end
  end
end
