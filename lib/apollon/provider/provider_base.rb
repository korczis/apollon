# encoding: utf-8

require 'fog'
require 'pp'

module Apollon
  module Provider
    # Base class for specific Providers
    class ProviderBase
      # Generic Provider Machine
      class Machine
        attr_reader :provider, :machine

        alias_method :raw, :machine

        def initialize(provider, machine = nil)
          @provider = provider
          @machine = machine
        end

        def flavor
          @machine.flavor
        end

        def ip
          public_ip_address || private_ip_address
        end

        def method_missing(sym, *args, &block)
          @machine.send sym, *args, &block
        end
      end

      attr_reader :client, :config

      def initialize(client)
        @client = client
        @config = client.config[self.class.to_s.split('::').last]
        self
      end

      def machines(force_refresh = false)
        if @machines.nil? || force_refresh
          klass = self.class.const_get('Machine')
          @machines = @compute.servers.all.to_a.pmap { |m| klass.new(self, m) }
        end
        @machines
      end
    end
  end
end
