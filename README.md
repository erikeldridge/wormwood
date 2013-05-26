# Wormwood

Wormwood is an event-driven template rendering utility inspired by [Jekyll](https://github.com/mojombo/jekyll). It's great for rendering markdown, e.g., a README file, as you edit.

Wormwood will:

1. watch for changes to a template directory ( _./_ by default)
1. render the changed files (via [Tilt](https://github.com/rtomayko/tilt)) into a layout
1. write the rendered, laid-out content to an output directory ( _./_ by default).


## Installation

    $ gem install wormwood


## Usage

1. Create a file [Tilt](https://github.com/rtomayko/tilt) knows how to render, e.g., _foo.md_
1. Run `wormwood`
1. Edit _foo.md_ and observe the creation of _foo.html_

**Note:** Wormwood will generate a file called _&lt;layout name>.erb_ in your source directory if a file named "layout" doesn't already exist. Feel free to hack it.


## Configuration

Wormwood defines a few configuration options:

`--source` The directory containing the template and layout files. Defaults to "./"

`--destination` The directory to write rendered files to. Defaults to "./"

`--layout` The layout file name (without extension). Defaults to "layout".

`--variable` The name of the variable used to insert rendered content into the layout. Defaults to "content".


## Developing

1. Develop
1. Build gem `rake build`
1. Install gem `rake install`
1. Run tests `rake test`


## Changelog

0.0.7 generates default layout
0.0.6 adds layout support


## License

Copyright 2013 Erik Eldridge

Licensed under the MIT License
