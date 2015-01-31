# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon machine' do
  describe 'apollon machine list' do
    it 'List machines' do
      out = run_cli(['machine', 'list'])
      expect(out).to be_a_kind_of(String)
    end
  end
end