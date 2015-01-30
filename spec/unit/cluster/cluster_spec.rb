# encoding: utf-8

require 'apollon/cluster/cluster'

describe Apollon::Cluster::Cluster do
  it 'Is defined as class' do
    expect(Apollon::Cluster::Cluster.class).to eql(Class)
  end

  describe '#new' do
    it 'Creates new instance'
  end
end
