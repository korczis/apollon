require 'apollon/cli/cli'

describe Apollon::Cli do
  it 'Is defined' do
    expect(Apollon::Cli.nil?).to be_falsey
  end
end
