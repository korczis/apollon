# encoding: UTF-8

require 'pathname'

require_relative '../core'
require_relative '../version'

module Apollon
  # Apollon bootstrap module
  module Bootstrap
    BOOTSTRAP_DIR = Apollon::Core::APOLLON_DIR

    class << self
      def bootstrap(dir = BOOTSTRAP_DIR)
        puts "Bootstraping Apollon Environment - #{Apollon::VERSION}"

        Apollon::Core.create_app_dir(dir) unless Apollon::Core.app_dir_exists?(dir)
      end
    end
  end
end
#