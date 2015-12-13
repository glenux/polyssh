# vim: set ts=2 sw=2 et:

module PolySSH
  class NodeList
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
  end

	class NodeEntry
		attr_accessor :port
		attr_accessor :user
		attr_accessor :host

		attr_accessor :next
		attr_accessor :args

		def initialize(user: nil, host:, port:, args: nil)
			@user = user
			@host = host
			@port = port
			@args = args

      # Linked list part
			@next = nil
		end
	end #class
end #module

