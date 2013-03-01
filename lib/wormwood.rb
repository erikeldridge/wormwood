# -*- encoding: utf-8 -*-
require 'wormwood/version'
require 'directory_watcher'
require 'fileutils'
require 'tilt'

module Wormwood
  GLOB = '**/*.{erb,rhtml,markdown,mkd,md}'

  # ref: https://github.com/mojombo/jekyll/blob/master/lib/jekyll/commands/build.rb
  # ref: https://github.com/TwP/directory_watcher/blob/master/lib/directory_watcher.rb
  def self.watch(options)
    dw = DirectoryWatcher.new(options.source, :glob => GLOB, :pre_load => true)
    dw.interval = 1
    dw.add_observer do |*events|
      build events.collect{|e| e.path}, options
    end
    dw.start
    trap("INT") {exit 0}
    loop { sleep 1000 }
  end

  def self.build paths, options
    layout_path = Dir.glob(File.join(options.source, "#{options.layout}*")).first
    paths.each do |source_path|
      dest_path = File.join \
        options.destination,
        "#{File.basename(source_path, ".*")}.html"
      File.write \
        dest_path,
        Tilt.new(layout_path).render(nil, {options.variable => Tilt.new(source_path).render})
    end
  end

end
