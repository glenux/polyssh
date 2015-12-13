
module PolySSH
  class Cli
    def build_commands args
      node_chain = NodeList.new
      args_current = []

      args.each do |arg|
        if arg =~ /^-/ then
          args_current << arg
        elsif arg =~ /^((.+)@)?([^:]+):?(\d+)?$/ then
          node_new = NodeEntry.new(
            user: $1,
            host: $3,
            port: $4 || 22,
            args: args_current
          )
          node_chain << node_new

        else
          STDERR.puts "ERROR: Unexpected argument #{arg}"
          exit 1
        end
      end
      return node_chain
    end
  end #class
end #module

