# -*- encoding: utf-8 -*-
require 'wormwood/version'
require 'directory_watcher'
require 'fileutils'
require 'tilt'

module Wormwood

  # ref: https://github.com/mojombo/jekyll/blob/master/lib/jekyll/commands/build.rb
  # ref: https://github.com/TwP/directory_watcher/blob/master/lib/directory_watcher.rb
  def self.watch(options)
    FileUtils.mkdir_p(options.destination) unless File.exists? options.destination
    dw = DirectoryWatcher.new(options.source)
    dw.interval = 1
    dw.add_observer do |*events|
      build events.collect{|e| e.path}, options
    end
    dw.start
    trap("INT") {exit 0}
    loop { sleep 1000 }
  end

  def self.build paths, options
    paths.each do |source_path|
      begin
        dest_path = "#{options.destination}/#{File.basename(source_path, ".*")}.html"
        File.write dest_path, Tilt.new(source_path).render
        puts "Wormwood success: rendered #{source_path} → #{dest_path}."
      rescue RuntimeError => e
        warn "Wormwood error: (#{e.message})."
      end
    end
  end

end
