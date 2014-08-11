# encoding: UTF-8

require_relative '../version'

module Apollon
  module Cleanup
    class << self
      def cleanup
        puts "Cleaning up - #{Apollon::VERSION}"
      end
    end
  end
end
