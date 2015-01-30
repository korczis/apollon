# encoding: utf-8

require 'gli'
require 'pathname'
require 'pp'

require_relative 'shared'

require_relative '../version'

def launch(argv = ARGV)
  Apollon::Cli.main(argv)
end

module Apollon
  # Apollon CLI
  module Cli
    extend Apollon::Cli

    program_desc "Apollon #{Apollon::VERSION}"

    cmds = File.absolute_path(File.join(File.dirname(__FILE__), 'cmd'))
    Dir.glob(cmds + '/*.rb').each do |file|
      require file
    end

    def main(argv = ARGV)
      run(argv)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  launch(ARGV)
end
