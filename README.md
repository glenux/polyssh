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


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/polyssh.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

