# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon keys' do
  describe 'apollon keys show' do
    it 'Show keys' do
      out = run_cli(%w(keys show))
      expect(out).to be_a_kind_of(String)
    end
  end
end
