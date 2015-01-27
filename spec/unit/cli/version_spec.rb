require 'apollon/cli/cli'
require 'apollon/version'

describe 'Apollon::Cli - version' do
  describe 'version' do
    it 'Prints version' do
      args = %w(version)

      out = run_cli(args)
      expect(out).to include(Apollon::VERSION)
    end
  end
end
