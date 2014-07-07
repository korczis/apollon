# encoding: utf-8

require 'gli'

include GLI::App

program_desc 'Apollon CLI'

desc 'Build new web-unit'
command :build do |c|
  c.action do # |global_options, options, args|
    # TODO: Implement here
  end
end

desc 'Deploy built web-unit'
command :deploy do |c|
  c.action do # |global_options, options, args|
    # TODO: Implement here
  end
end

desc 'List deployed web-units'
command :list do |c|
  c.action do # |global_options, options, args|
    # TODO: Implement here
  end
end

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
