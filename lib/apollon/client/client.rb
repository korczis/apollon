# encoding: utf-8

require_relative '../auth/auth'
require_relative '../cluster/cluster'

require_relative '../version'

# Apollon module
module Apollon
  class Client
    attr_reader :auth, :cluster, :dir

    def initialize
      @auth = Apollon::Auth.new
      @dir = File.expand_path('~/.apollon')
      init_dir

      @cluster = Apollon::Cluster.new(self)
      self
    end

    def init_dir
      FileUtils.mkdir_p(dir) unless File.directory?(dir)
    end

    def version
      Apollon::VERSION
    end
  end
end