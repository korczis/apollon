require 'apollon/cli/app'

describe Apollon::Cli::App do
  it 'Is defined' do
    expect(Apollon::Cli::App.nil?).to be_falsey
  end
end
