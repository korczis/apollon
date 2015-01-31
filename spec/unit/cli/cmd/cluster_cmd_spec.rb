# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon cluster show' do
  it 'Prints version' do
    out = run_cli(['cluster', 'show'])
    expect(out).to be_a_kind_of(String)
  end
end