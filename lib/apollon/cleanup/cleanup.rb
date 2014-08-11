# encoding: UTF-8

require_relative '../version'
require_relative '../core'

module Apollon
  # Apollon cleanup module
  module Cleanup
    class << self
      def cleanup(dir = Apollon::Core::APOLLON_DIR)
        puts 'Cleaning Apollon Environment'

        Apollon::Core.remove_app_dir(dir) if Apollon::Core.app_dir_exists?(dir)
      end
    end
  end
end
