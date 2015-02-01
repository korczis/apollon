# encoding: utf-8

require 'fog'
require 'pp'

module Apollon
  module Provider
    # Base class for specific Providers
    class ProviderBase
      # Generic Provider Machine
      class Machine
        attr_reader :config, :compute, :machine, :provider

        alias_method :raw, :machine

        def initialize(provider, compute = nil, machine = nil)
          @config = {}
          @provider = provider
          @compute = compute
          @machine = machine
        end

        def as_json(opts = {})
          {
            id: id,
            image_id: image_id,
            public_ip_address: public_ip_address,
            private_ip_address: private_ip_address,
            flavor: flavor,
            provider: provider.name,
            region: region
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
          return res if res #.kind_of?(String)
          # return res.attributes['slug'] if res.kind_of?(Fog::Compute::DigitalOcean::Region)
        end
      end

      DEFAULT_OPTS = {
      }

      attr_reader :client, :compute, :config, :opts

      def initialize(client, opts = DEFAULT_OPTS)
        @client = client
        @config = client.config[name] ||= {}
        @opts = DEFAULT_OPTS.merge(opts)
        self
      end

      def as_json(opts = {})
        {
          name: name,
          regions: regions
        }
      end

      def create_machine(opts = {})
        compute.servers.create(opts)
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

      def regions
        @regions ||= @compute.regions
      end

    end
  end
end
