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

      def list(ids = :all)
        providers = []
        if ids == :all
          providers = client.auth.providers
        else
          machines = ids.map { |m| m.downcase}
          providers = client.auth.providers.values.select { |p| machines.include?(p.name.downcase) }
        end

        res = providers.map do |provider|
          provider.machines
        end
        res.flatten
      end
    end
  end
end