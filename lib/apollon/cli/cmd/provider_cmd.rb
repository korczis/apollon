# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

include GLI::App

require_relative '../../provider/provider'

require_relative '../shared'

def providers
  Apollon::Provider.list
end

desc 'Provider'
command :provider do |c|
  c.desc 'List supported providers'
  c.command :list do |list|
    list.action do
      data = providers.each_with_index.map do |item, i|
        [i, item[:name], item[:klass], item[:path]]
      end

      # TODO: Implement here
      puts Terminal::Table.new title: 'Provider List',
                               headings: %w(Id Name Class Path),
                               rows: data
    end
  end

  providers.each do |provider|
    name = provider[:name]
    klass = provider[:klass]
    path = provider[:path]
    c.desc "Provider #{klass}"
    c.command name do |cmd|
      cmd.action do
        puts "Hello I am #{name} - #{klass} - #{path}"
      end
    end
  end
end
