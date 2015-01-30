# encoding: utf-8

require 'apollon/provider/provider_base'

describe Apollon::Provider::ProviderBase do
  it 'Is defined as class' do
    expect(Apollon::Provider::ProviderBase.class).to eql(Class)
  end

  describe '#new' do
    it 'Creates new instance'
  end
end
