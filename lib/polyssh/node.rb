# vim: set ts=2 sw=2 et:

module PolySSH
	class Node
		attr_reader :port
		attr_reader :user
		attr_reader :host

		attr_reader :next
		attr_reader :prev
		attr_accessor :args

		def initialize
			@user = nil
			@host = nil
			@port = nil
			@args = []
			@next = nil
			@prev = nil
		end

		def append node
			node.prev = self
			self.next = node
		end

		def to_s
			if @prev.nil? then # first
				if @next.nil? then
					[
					  "ssh #{@user}#{@host}",
			      "-p #{@port}",
			      "-o UserKnownHostsFile=/dev/null",
			      "-o StrictHostKeyChecking=no"
			    ]
				else
					[
					  "ssh #{@user}#{@host}",
			      "-p #{@port}",
			      "-o UserKnownHostsFile=/dev/null",
			      "-o StrictHostKeyChecking=no",
	          "-L #{@tunnel_port}:#{host}:#{port}"
			    ]
					#result << "#{ssh_cmd} -f sleep 10 #{ssh_args}"
				end
			end
		end #def
	end #class
end #module

