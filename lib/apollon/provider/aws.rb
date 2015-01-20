# encoding: utf-8

require 'fog'

require_relative 'provider_base'

module Apollon
  module Provider
    class Aws < ProviderBase
      class Machine < ProviderBase::Machine
      end

      def initialize(client)
        super(client)
        opts = {
          :provider => 'AWS',
          :aws_access_key_id => config['key'],
          :aws_secret_access_key => config['secret']
        }

        @compute = Fog::Compute.new(opts)
        self
      end

      def machines
        @compute.servers.all.to_a.map { |m| Machine.new(self, m) }
      end
    end
  end
end
