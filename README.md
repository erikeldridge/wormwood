# Wormwood

Wormwood is an event-driven file rendering utility inspired by [Jekyll](https://github.com/mojombo/jekyll).

Wormwood:

1. watches for changes to a template directory ( _./_ by default)
2. renders the changed files (via [Tilt](https://github.com/rtomayko/tilt))
3. writes the rendered output to an output directory ( _./_ by default).

## Usage

1. Create a file [Tilt](https://github.com/rtomayko/tilt) knows how to render, e.g., _foo.erb_
2. Create a file named "layout" in the same directory, with a Tilt-supported extension, e.g., _layout.erb_
3. Reference _content_ in the layout, e.g., `<%= content %>`
4. Run `wormwood`
5. Edit _foo.erb_ and observe changes applied to _foo.html_


## Configuration

Wormwood defines a few configuration options:

`--source` The directory containing the template and layout files. Defaults to "./"

`--destination` The directory to write rendered files to. Defaults to "./"

`--layout` The layout file name (without extension). Defaults to "layout".

`--variable` The name of the variable used to insert rendered content into the layout. Defaults to "content".


## Installation

Add this line to your application's Gemfile:

    gem 'wormwood'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wormwood


## Changelog

0.0.6 adds layout support

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
