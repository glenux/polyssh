
module PolySSH
  class Cli
    def build_commands args
      node_chain = Node.new
      node_current = node_chain

      args.each do |arg|
        if arg =~ /^-/ then
          node_current.args << arg
        elsif arg =~ /^((.+)@)?([^:]+):?(\d+)?$/ then
          node_current.user = $1
          node_current.host = $3
          node_current.port = $4 || 22

          node_current.append Node.new
          node_current = node_current.next

          if first then
          else
            STDERR.puts "ERROR: Unexpected argument #{arg}"
            exit 1
          end
        end
        return node_chain
      end
    end #class
  end #module
end

