# encoding: utf-8

require 'gli'
require 'pp'
require 'terminal-table'

require_relative '../shared'

require_relative '../../core'

require_relative '../../puppet/puppet'

include GLI::App

def print_puppet_table(data, title = '', headings = nil, _base_dir = Apollon::Puppet::PUPPET_DIR)
  rows = data.each_with_index.map do |item, i|
    [i, item[:name], item[:rel], item[:path]]
  end

  puts Terminal::Table.new title: title,
                           headings: headings,
                           rows: rows
end

desc 'Puppet low-level commands'
command :puppet do |puppet|
  # Puppet manifests
  puppet.desc 'Puppet manifests'
  puppet.command :manifest do |manifest|
    # Apply puppet manifest
    manifest.desc 'Apply puppet manifest'
    manifest.command :apply do |apply|
      # TODO: Implement
      apply.action do |global_options, options, args|
        args.each do |arg|
          cmd = "puppet apply --modulepath=#{Apollon::Core::MODULE_DIR} #{Apollon::Core::MANIFEST_DIR}/#{arg}.pp"
          puts cmd
          system cmd
        end
      end
    end

    # List puppet manifests
    manifest.desc 'List puppet manifest'
    manifest.command :list do |list|
      list.action do
        print_puppet_table(Apollon::Puppet.manifests,
                           'Puppet Manifests',
                           %w(id Name Relative Path),
                           Apollon::Core::MANIFEST_DIR)
      end
    end
  end

  # Puppet modules
  puppet.desc 'Puppet modules'
  puppet.command :module do |modul|
    # List puppet manifests
    modul.desc 'List puppet modules'
    modul.command :list do |list|
      list.action do
        print_puppet_table(Apollon::Puppet.modules,
                           'Puppet Modules',
                           %w(id Name Relative Path),
                           Apollon::Core::MODULE_DIR)
      end
    end
  end
end
