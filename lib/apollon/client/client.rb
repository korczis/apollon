# encoding: utf-8

require_relative '../auth/auth'
require_relative '../cluster/cluster'
require_relative '../machine/machine'

require_relative '../version'

# Apollon module
module Apollon
  # Apollon Client module
  module Client
    # Apollon Client class
    class Client
      attr_reader :auth, :cluster, :machine, :opts

      DEFAULT_OPTS = {
        app_data_dir: File.expand_path('~/.apollon')
      }

      def initialize(opts = DEFAULT_OPTS)
        # Merge options
        @opts = DEFAULT_OPTS.merge(opts)

        # Create directory for application data
        Client.init_app_data_dir(@opts[:app_data_dir])

        # Initialize auth module
        @auth = Auth::Auth.new(self)

        # Initialize cluster module
        @cluster = Apollon::Cluster::Cluster.new(self)

        # Initialize machine module
        @machine = Machine::Machine.new(self)
        self
      end

      class << self
        def app_data_dir(opts = DEFAULT_OPTS)
          opts[:app_data_dir]
        end

        def init_app_data_dir(dir = app_data_dir)
          FileUtils.mkdir_p(dir) unless File.directory?(dir)
        end
      end

      def providers(*args)
        res = @auth.providers(*args)
        res
      end

      def version
        Apollon::VERSION
      end
    end
  end
end
