# encoding: utf-8

require 'pp'

require_relative '../auth/auth'

require_relative '../version'

# Apollon module
module Apollon
  # Apollon Machine module
  module Machine
    # Apollon machine command implementation
    class Machine
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def list(ids = :all)
        providers = []
        if ids == :all
          providers = client.auth.providers
        else
          machines = ids.map(&:downcase)
          providers = client.auth.providers.select { |p| machines.include?(p.name.downcase) }
        end

        res = providers.map(&:machines)
        res.flatten
      end
    end
  end
end
