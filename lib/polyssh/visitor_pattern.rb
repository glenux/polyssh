module PolySSH
  module VisitorBase
    def do_visit object
      object.accept(self)
    end
  end


  module Visitable
    def accept visitor
      class_name = self.class.name.gsub('::','_').downcase
      visitor.send 'visit_' + class_name, self
    end
  end
end
