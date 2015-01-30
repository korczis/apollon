# encoding: UTF-8

require 'apollon/auth/auth'

describe Apollon::Auth::Auth do
  it 'Is defined as class' do
    expect(Apollon::Auth::Auth.class).to eql(Class)
  end

  describe '#new' do
    it 'Creates new instance'
  end
end
