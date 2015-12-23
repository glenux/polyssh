
module PolySSH
  class CommandBuilder
    include VisitorBase 

    def initialize 
      @commands = []
    end

    def visit_polyssh_nodelist node_list
        puts "Visiting NodeList"
        pp node_list
        if node_list.count > 0 then
          node_list.first.accept(self)
        end
    end

    def visit_polyssh_nodeentry node_entry
      puts "Visiting NodeEntry"
      pp node_entry
      unless node_entry.next.nil? then
        node_entry.next.accept(self)
      end
    end
  end
end

