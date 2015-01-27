# encoding: utf-8

require_relative 'provider_base'

module Apollon
  module Provider
    # DigitalOcean provider
    class DigitalOcean < ProviderBase
      class Machine < ProviderBase::Machine
      end

      REGIONS = %w(
        ams2
        ams3
        lon1
        nyc2
        nyc3
        sfo1
        sgp1
      )

      def initialize(client)
        super(client)

        opts = {
          provider: 'DigitalOcean',
          digitalocean_api_key: config['key'],
          digitalocean_client_id: config['id']
        }

        @compute = Fog::Compute.new(opts)
        self
      end

      def regions
        REGIONS
      end
    end
  end
end
