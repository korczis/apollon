# encoding: UTF-8

require 'apollon/cli/cli'

# CliHelper module
module CliHelper
  # Execute block and capture its stdou
  # @param block Block to be executed with stdout redirected
  # @returns Captured output as string
  def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end

  # Run CLI with arguments and return captured stdout
  # @param args Arguments
  # @return Captured stdout
  def run_cli(args = [])
    old = $PROGRAM_NAME
    $PROGRAM_NAME = 'apollon'
    res = capture_stdout { launch(args) }
    $PROGRAM_NAME = old
    res
  end
end
