# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon machines' do
  describe 'apollon machines list' do
    it 'Lists machines' do
      out = run_cli(%w(machines list))
      expect(out).to be_a_kind_of(String)
    end
  end
end
