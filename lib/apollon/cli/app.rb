# encoding: utf-8

require 'gli'

include GLI::App

require_relative 'cmd/cmd'

program_desc 'Apollon CLI'

module Apollon
  # Apollon CLI
  module Cli
    class << self
      def run(argv = ARGV)
        Kernel.send(:run, argv)
      end
    end
  end
end

run(ARGV)
