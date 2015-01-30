# encoding: UTF-8

require 'apollon/cli/cli'

describe Apollon::Cli do
  it 'Is defined as module' do
    expect(Apollon::Cli.class).to eql(Module)
  end

  it 'Has run_cli working' do
    out = run_cli
    expect(out).to be_kind_of(String)
  end
end