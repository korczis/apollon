# encoding: utf-8

require 'pp'

require_relative '../auth/auth'

require_relative '../version'

# Apollon module
module Apollon
  module Cluster
    class Cluster
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def machines(ids = :all)
        client.machine.list(ids)
      end
    end
  end
end