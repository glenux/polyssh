PolySSH
=======

A multi-hop SSH connection tool.

## Installation

Simply type :

    $ gem install polyssh

## Usage

    $ polyssh [..list of intermediate hosts...] user@host:port

You can use as many intermediate hosts as you need.

Example: Connecting to ``destination`` machine via the ``firewall`` (on non-default port 7222)

                                 ||
                                 ||
    +--------------+      +--------------+      +--------------+
    | POLYSSH USER |----->|   FIREWALL   |------| DESTINATION  |
    +--------------+      +--------------+      +--------------+
                                 ||
                                 ||

Type the following command using polyssh :

    $ polyssh foo@firewall:7222 bar@destination


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/glenux/polyssh.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

