# encoding: utf-8

require 'apollon/cli/cli'
require 'apollon/version'

describe 'Apollon' do
  describe 'VERSION' do
    it "Equals to #{Apollon::VERSION}" do
      expect(Apollon::VERSION).to eql('0.1.0')
    end
  end
end
