# encoding: utf-8

require 'pp'

require_relative '../auth/auth'

require_relative '../version'

# Apollon module
module Apollon
  module Machine
    class Machine
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def list
        []
      end
    end
  end
end