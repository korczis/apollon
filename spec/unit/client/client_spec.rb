# encoding: utf-8

require 'apollon/client/client'

describe Apollon::Client::Client do
  it 'Is defined as class' do
    expect(Apollon::Client::Client.class).to eql(Class)
  end

  describe '#new' do
    it 'Creates new instance'
  end
end
