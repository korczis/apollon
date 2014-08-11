# encoding: UTF-8

require_relative 'version'

module Apollon
  # Apollon Core module
  module Core
    HOME_DIR ||= File.expand_path('~')
    APOLLON_DIR ||= File.join(HOME_DIR, '.apollon')

    BASE_DIR ||= File.absolute_path(File.join(File.dirname(__FILE__),
                                              '..',
                                              '..',
                                              '..'))

    PUPPET_DIR ||= File.join(BASE_DIR, 'data', 'puppet')
    MODULE_DIR ||= File.join(PUPPET_DIR, 'modules')
    MANIFEST_DIR ||= File.join(PUPPET_DIR, 'manifests')

    PUPPET_MANIFEST_PATTERN = '/*'
    PUPPET_MODULE_PATTERN = '/*'

    VERSION_FILE_PATH = File.join(APOLLON_DIR, 'version.txt')

    class << self
      def app_dir_exists?(dir = APOLLON_DIR)
        File.exist?(dir)
      end

      def create_app_dir(dir = APOLLON_DIR)
        puts "Creating Apollon application data directory - #{dir}"
        Dir.mkdir(dir)

        create_version_file(dir)
      end

      def create_version_file(dir = APOLLON_DIR)
        File.open(VERSION_FILE_PATH, 'w') do |f|
          f.write("#{Apollon::VERSION}\n")
        end
      end

      def remove_app_dir(dir = APOLLON_DIR)
        puts "Removing Apollon application data directory - #{dir}"
        Dir.rmdir(dir)
      end
    end
  end
end
