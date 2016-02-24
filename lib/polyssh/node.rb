# vim: set ts=2 sw=2 et:

module PolySSH
  class NodeList
	  include Visitable
    include Enumerable

    def each 
      ptr = @head 
      while not ptr.nil? do
        yield ptr 
        ptr = ptr.next
      end
    end

    def initialize
      @head = nil
      @tail = nil
    end

    def <<(node)
      if @head.nil? then
        @head = node
        @tail = node
      else
        @tail.next = node
        @tail = node
      end
      self
    end

    def empty? 
      (@head == nil && @tail = nil)
    end
  end

	class NodeEntry
	  include Visitable

		attr_accessor :port
		attr_accessor :user
		attr_accessor :host

		attr_accessor :next
		attr_accessor :args

		def initialize(user:, host:, port: nil, args: nil)
			@user = user
			@host = host
			@port = port || 22
			@args = args || []

      # Linked list part
			@next = nil
		end
	end #class
end #module

