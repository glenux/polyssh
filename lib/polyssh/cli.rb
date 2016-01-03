
require 'net/ssh'
require 'net/scp'

module PolySSH
  class Cli
    attr_reader :chain

    def self.start args
      app = self.new
      app.parse_cmdline args

      app.build_commands app.chain

      #app.run commands

    end

    def initialize
      @chain = NodeList.new
    end

    def parse_cmdline args
      args_current = []
      args.each do |arg|
        if arg =~ /^-/ then
          args_current << arg
        elsif arg =~ /^((.+)@)?([^:]+):?(\d+)?$/ then
          # ssh_options = Net::SSH::Config.for($3)
          # pp ssh_options
          node_new = NodeEntry.new(
            user: $2,
            host: $3,
            port: $4 || 22,
            args: args_current
          )
          @chain << node_new
          args_current = []

        else
          STDERR.puts "ERROR: Unexpected argument #{arg}"
          exit 1
        end
      end
      return @chain
    end


    def build_commands chain
      commands = chain.accept(CommandBuilder.new)
      return commands
    end
  end #class
end #module

