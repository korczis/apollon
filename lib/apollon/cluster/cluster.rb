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

      def machines
        res = client.auth.providers.keys.map do |provider_name|
          provider = client.auth.provider(provider_name)
          provider.machines
        end
        res.flatten
      end
    end
  end
end