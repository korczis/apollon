# encoding: utf-8

require 'digitalocean'

require_relative 'provider_base'

module Apollon
  module Provider
    class DigitalOcean < ProviderBase
      class Machine < ProviderBase::Machine
      end

      def initialize(client)
        super(client)
        Digitalocean.client_id = config['id']
        Digitalocean.api_key = config['key']

        # opts = {
        #   :provider => 'DigitalOcean',
        #   :digitalocean_api_key => config['key'], # your API key here
        #   :digitalocean_client_id => config['id'] # your client key here
        # }
        #
        # @compute = Fog::Compute.new(opts)
        self
      end

      def machines
        Digitalocean::Droplet.all.droplets.map { |m| Machine.new(self, m) }
      end
    end
  end
end