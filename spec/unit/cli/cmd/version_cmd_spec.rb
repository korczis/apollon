# encoding: UTF-8

require 'apollon/cli/cli'

describe 'apollon version' do
  it 'Prints version' do
    out = run_cli(['version'])
    expect(out).to include(Apollon::VERSION)
  end
end