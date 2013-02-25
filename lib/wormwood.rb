require 'wormwood/version'
require 'directory_watcher'
require 'erb'
require 'tilt'

module Wormwood

  # https://github.com/mojombo/jekyll/blob/master/lib/jekyll/commands/build.rb
  # https://github.com/TwP/directory_watcher/blob/master/lib/directory_watcher.rb
  def self.watch
    dw = DirectoryWatcher.new("raw")
    dw.interval = 1
    dw.add_observer do |*events|
      build events.collect{|e| e.path}
    end
    dw.start
    trap("INT") {exit 0}
    loop { sleep 1000 }
  end

  def self.build paths
    paths.each do |path|
      File.write "./public/#{File.basename(path, ".*")}.html", Tilt.new(path).render
    end
  end

end
