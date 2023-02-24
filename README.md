# Edir

This is a Gem for parsing files. Right now there's no configuration and offers essentially 1 feature: reading EDI and outputting it as formatted Ruby data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edir'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install edir

## Usage

Right now there's not a lot to it. Use the parser like so:

```ruby
require 'edir'

edi_data = Edir::Parser.new.parse(edi_string)
```

The lexer is implemented in pure ruby, so changes in `lexer.rb` are always current. However,
the parser is converted from a racc/yacc specification to pure ruby. To rebuild the parser, run

```ruby
bundle exec rake parser[_debug]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/edir.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
