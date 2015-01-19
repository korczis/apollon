# encoding: utf-8

require 'digitalocean'

module Apollon
  module Provider
    class DigitalOcean
      def initialize(client)
        config = client.providers[self.class.to_s.split('::').last]

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
        Digitalocean::Droplet.all.droplets
      end
    end
  end
end