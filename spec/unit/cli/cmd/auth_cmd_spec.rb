# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon auth' do
  describe 'apollon auth show' do
    it 'Shows auth info' do
      out = run_cli(%w(auth show))
      expect(out).to be_a_kind_of(String)
    end
  end
end
