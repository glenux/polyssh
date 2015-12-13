PolySSH
=======

A multi-hop SSH connection tool.

## Installation

Simply type :

    $ gem install polyssh

## Usage

    $ polyssh [..list of ssh options and intermediate hosts...] user@host:port

You can use as many intermediate hosts as you need.

### Example 1 : Traversing a single machine

We wan to connect

* to a remote host called ``destination`` (as user ``charlie``, on default port)
* via a firewall (as user ``alice``, on non-default port 7222)

                                 ||
                                 ||
    +--------------+      +--------------+      +--------------+
    | POLYSSH USER |----->|   FIREWALL   |----->| DESTINATION  |
    +--------------+      +--------------+      +--------------+
                                 ||
                                 ||

The corresponding command using polyssh is :

    $ polyssh alice@firewall:7222 charlie@destination

## Example 2

via the ``firewall`` and ``router`` :

                                 ||
                                 ||
    +--------------+      +--------------+      +--------------+      +--------------+
    | POLYSSH USER |----->|   FIREWALL   |------|    ROUTER    |------| DESTINATION  |
    +--------------+      +--------------+      +--------------+      +--------------+
                                 ||
                                 ||

Type the following command using polyssh :

    $ polyssh alice@firewall:7222 bob@router charlie@destination


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/glenux/polyssh.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

