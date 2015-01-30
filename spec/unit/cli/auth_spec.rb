require 'apollon/cli/cli'
require 'apollon/version'

describe 'Apollon::Cli - auth' do
  describe 'version' do
    it 'Prints version' do
      args = %w(auth show)

      out = run_cli(args)
      #expect(out).to include('auth')
    end
  end
end
