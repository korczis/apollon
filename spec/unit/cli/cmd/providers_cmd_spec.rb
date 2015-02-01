# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon providers' do
  describe 'apollon providers show' do
    it 'Shows providers' do
      out = run_cli(['providers', 'show'])
      expect(out).to be_a_kind_of(String)
    end
  end
end