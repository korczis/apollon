# encoding: utf-8

require 'fog'
require 'pp'

module Apollon
  module Provider
    # Base class for specific Providers
    class ProviderBase
      # Generic Provider Machine
      class Machine
        attr_reader :compute, :machine, :provider

        alias_method :raw, :machine

        def initialize(provider, compute = nil, machine = nil)
          @provider = provider
          @compute = compute
          @machine = machine
        end

        def as_json(opts = {})
          {
            public_ip_address: public_ip_address,
            private_ip_address: private_ip_address,
            flavor: flavor.name,
            provider: provider.name,
            region: region,
            id: id
          }
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

        def region
          res = @compute.send(:region) if @compute.respond_to?(:region)
          res = @machine.send(:region) if @machine.respond_to?(:region)
          return res if res.kind_of?(String)
          return res.attributes['slug'] if res.kind_of?(Fog::Compute::DigitalOcean::Region)
        end
      end

      attr_reader :client, :config

      def initialize(client)
        @client = client
        @config = client.config[name]
        self
      end

      def as_json(opts = {})
        {
          name: name,
          regions: regions
        }
      end

      def machines(force_refresh = false)
        if @machines.nil? || force_refresh
          klass = self.class.const_get('Machine')
          @machines = @compute.servers.all.to_a.pmap { |m| klass.new(self, @compute, m) }
        end
        @machines
      end

      def name
        self.class.to_s.split('::').last
      end
    end
  end
end
