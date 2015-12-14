PolySSH
=======

[![Travis-CI](https://api.travis-ci.org/glenux/polyssh.png?branch=master)](https://travis-ci.org/glenux/polyssh)
[![Code Climate](https://codeclimate.com/github/glenux/polyssh/badges/gpa.svg)](https://codeclimate.com/github/glenux/polyssh)


A multi-hop SSH connection tool.

## Installation

Simply type :

    $ gem install polyssh

## Usage

    $ polyssh [..list of ssh options and intermediate hosts...] user@host:port

You can use as many intermediate hosts as you need.

### Example 1 : Traversing a single machine

We want to connect

* to a remote host called ``destination`` (as user ``bob``, on default port)
* via a firewall (as user ``alice``, on non-default port 7222)

The corresponding command using polyssh is :

    $ polyssh alice@firewall:7222 bob@destination

## Example 2 : traversing two machines with options

We want to connect

* to a remote host called ``destination`` (as user ``charlie``, on default port)
* via a firewall (as user ``alice``, on non-default port 7222)
* then via a router  (as user ``bob``, on default), with parameters (FIXME)

Type the following command using polyssh :

    $ polyssh alice@firewall:7222 -verbose Cypherbob@router charlie@destination


## Credits

* Initial idea : [Bob Muller on Stack Overflow](http://superuser.com/a/377215)
* Ruby rewrite & packaging : Glenn Y. Rolland

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/glenux/polyssh.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

