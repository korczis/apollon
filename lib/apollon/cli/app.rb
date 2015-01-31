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

    require_relative 'cmd/cmds'

    post do |_global, _command, _options, _args|
      # Post logic here
      # Use skips_post before a command to skip this
      # block on that command only
    end

    on_error do |exception|
      # Error logic here
      # return false to skip default error handling
      # binding.pry
      puts exception.backtrace
      puts exception.inspect
      true
    end

    def main(argv = ARGV)
      run(argv)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  launch(ARGV)
end


