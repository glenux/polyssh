
require 'net/ssh'
require 'net/scp'
require 'optparse'
require 'colorize'

module PolySSH
  class Cli
    ACTION_NONE = :none
    ACTION_HELP = :help
    ACTION_HOP = :hop

    def self.start args
      app = self.new 
      app.run args
    end

    def run args
      parse_cmdline args

      case @action 
      when ACTION_HELP
        puts @usage
        exit 0
      when ACTION_HOP then
        puts "Building SSH hops...".yellow
        build_commands
        #app.commands.each{|x| puts x }

        puts "Running SSH hops...".yellow
        run_commands
      when ACTION_NONE
        puts @usage
        puts "ERROR: no hop defined!"
        exit 1
      else
        puts @usage
        puts "ERROR: internal error!"
        exit 1
      end
    end

    def initialize
      @chain = NodeList.new
      @action = ACTION_HOP
      @commands = []
      @options = {}
      @usage = nil
    end

    def parse_cmdline args
      _parse_cmdline_options args
      _parse_cmdline_hops args

      if @chain.empty? then
        @action = ACTION_NONE
      end
      
    end

    def run_commands
      @commands[0..-2].each do |baseport,cmd|
        fork { exec cmd + ' >/dev/null 2>&1 ' }
        _wait_active_port baseport
      end
      _baseport, cmd = @commands.last
      system cmd
    end

    def build_commands
      @commands = @chain.accept(CommandBuilder.new)
      return @commands
    end

    private 

    def _parse_cmdline_hops args
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

    def _wait_active_port port
      cmd = ">/dev/null 2>&1 nc -z -q1 -w1 localhost #{port}"
      while !system(cmd) do
        #puts cmd
        sleep 0.2
      end
    end

    def _parse_cmdline_options args
      @usage = OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} [options]"

        opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
          @options[:verbose] = v
        end
        opts.on('-h', '--help', 'Prints this help') do
          @action = ACTION_HELP
        end

        opts.on('--', '--', "Close #{$0} options (other options will pass to ssh)") do |v|
          raise FinalOption
        end
      end
      @usage.parse! args
      
    rescue FinalOption
      # nothing 
    ensure
      return nil
    end
  end #class
end #module

