
require 'net/ssh'
require 'net/scp'
require 'optparse'

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
      @options = {}
    end

    def parse_cmdline args
      _parse_cmdline_options args
      _parse_cmdline_hops args

    end


    def build_commands chain
      commands = chain.accept(CommandBuilder.new)
      return commands
    end

    private 

    def _parse_cmdline_hops args
      puts args
      args_current = []
      args.each do |arg|
        case arg
        when /^-/
          args_current << arg
        when /^((.+)@)?([^:]+):?(\d+)?$/
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

    def _parse_cmdline_options args
      OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          @options[:verbose] = v
        end
        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end

        opts.on("--", "--", "Close #{$0} options (other options will pass to ssh)") do |v|
          raise FinalOption
        end
      end.parse! args
    rescue FinalOption
    ensure
      return nil
    end
  end #class
end #module

