# encoding: UTF-8

require 'apollon/cli/cli'

describe Apollon::Cli do
  it 'Has Apollon::Cli class' do
    expect(Apollon::Cli).to be_truthy
  end

  it 'Has run_cli working' do
    run_cli
  end
end