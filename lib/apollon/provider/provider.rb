# encoding: UTF-8

require_relative '../extensions/string'

module Apollon
  # Provider module
  module Provider
    class << self
      def list
        base = File.join(File.dirname(__FILE__), 'providers')
        providers = File.absolute_path(base)
        Dir.glob(providers + '/*.rb').map do |file|
          name = file.gsub(base + '/', '').gsub('.rb', '')
          {
            name: name,
            path: file,
            klass: name.modulize
          }
        end
      end
    end
  end
end
