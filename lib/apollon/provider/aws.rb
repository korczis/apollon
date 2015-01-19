# encoding: utf-8

require 'fog'

module Apollon
  module Provider
    class Aws
      def initialize(client)
        config = client.providers[self.class.to_s.split('::').last]

        opts = {
          :provider => 'AWS',
          :aws_access_key_id => config['key'],
          :aws_secret_access_key => config['secret']
        }

        @compute = Fog::Compute.new(opts)
        self
      end

      def machines
        @compute.servers.all.to_a
      end
    end
  end
end
