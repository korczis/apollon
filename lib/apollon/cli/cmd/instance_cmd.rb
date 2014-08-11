# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

include GLI::App

require_relative '../../instance/instance'

require_relative '../shared'

desc 'Instance'
command :instance do |c|
  c.desc 'List existing instances'
  c.command :list do |list|
    list.action do
      data = Apollon::Instance.list.each_with_index.map do |_item, _i|
        []
      end

      # TODO: Implement here
      puts Terminal::Table.new title: 'Instance List',
                               headings: %w(Id Name Class Path),
                               rows: data
    end
  end
end
