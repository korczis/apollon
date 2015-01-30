# encoding: utf-8

require 'apollon/logger/logger'

describe Apollon::Logger::Logger do
  it 'Is defined as class' do
    expect(Apollon::Machine::Machine.class).to eql(Class)
  end

  describe '#new' do
    it 'Creates new instance'
  end
end
