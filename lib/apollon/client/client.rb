# encoding: utf-8

require_relative '../auth/auth'
require_relative '../cluster/cluster'
require_relative '../machine/machine'

require_relative '../version'

# Apollon module
module Apollon
  class Client
    attr_reader :auth, :cluster, :machine

    def initialize
      @auth = Auth::Auth.new(self)

      @cluster = Cluster::Cluster.new(self)

      @machine = Machine::Machine.new(self)
      self
    end

    def version
      Apollon::VERSION
    end
  end
end