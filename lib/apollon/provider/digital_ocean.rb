# encoding: utf-8

require_relative 'provider_base'

module Apollon
  module Provider
    class DigitalOcean < ProviderBase
      class Machine < ProviderBase::Machine
      end

      def initialize(client)
        super(client)

        opts = {
          :provider => 'DigitalOcean',
          :digitalocean_api_key => config['key'],
          :digitalocean_client_id => config['id']
        }

        @compute = Fog::Compute.new(opts)
        self
      end
    end
  end
end