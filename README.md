# Wormwood

Wormwood is an event-driven file rendering utility inspired by [Jekyll](https://github.com/mojombo/jekyll).

Wormwood watches for changes to a template directory (_raw_ by default), renders the changed files (via [Tilt](https://github.com/rtomayko/tilt)), and writes the rendered output to an output directory (_public_ by default).


## Usage

1. Create a _raw_ directory
2. Create a _public_ directory
3. Run `wormwood`
4. Edit files in _raw_ and observe the changes rendered in _public_


## Installation

Add this line to your application's Gemfile:

    gem 'wormwood'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wormwood


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
