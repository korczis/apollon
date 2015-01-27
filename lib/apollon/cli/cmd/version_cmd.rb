# encoding: utf-8

require_relative '../shared'
require_relative '../../version'

module Apollon
  # Apollon CLI
  module Cli
    desc 'Print version info'
    command :version do |cmd|
      cmd.action do |_global_options, _options, _args|
        pp Apollon::VERSION
      end
    end
  end
end