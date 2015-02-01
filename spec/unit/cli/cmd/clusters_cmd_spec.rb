# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon clusters' do
  describe 'apollon clusters show' do
    it 'Shows clusters' do
      out = run_cli(['clusters', 'show'])
      expect(out).to be_a_kind_of(String)
    end
  end
end