# encoding: utf-8

module Apollon
  module Provider
    class ProviderBase
      class Machine
        attr_reader :provider, :machine

        def initialize(provider, machine = nil)
          @provider = provider
          @machine = machine
        end

        alias_method :raw, :machine
      end

      attr_reader :client, :config

      def initialize(client)
        @client = client
        @config = client.providers[self.class.to_s.split('::').last]
        self
      end

      def machines
        fail 'Not implemented'
      end
    end
  end
end
