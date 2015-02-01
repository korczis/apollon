# encoding: utf-8

require 'barge'
require_relative 'provider_base'

# Apollon Module
module Apollon
  # Apollon Provider Module
  module Provider
    # Apollon DigitalOcean Provider
    class DigitalOcean < ProviderBase
      attr_reader :barge

      # Apollon DigitalOcean Machine
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
        @barge = Barge::Client.new(access_token: config['token'])
        self
      end

      def create_machine(opts = {})
        res = @barge.droplet.create(opts)
        @compute.servers.select { |s| s.id == res['droplet']['id'] }.first
      end

      def regions
        REGIONS
        # @regions ||= @compute.regions.map(&:slug)
      end
    end
  end
end
