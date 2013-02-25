require 'wormwood/version'
require 'directory_watcher'
require 'tilt'

module Wormwood

  # ref: https://github.com/mojombo/jekyll/blob/master/lib/jekyll/commands/build.rb
  # ref: https://github.com/TwP/directory_watcher/blob/master/lib/directory_watcher.rb
  def self.watch(options)
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
    paths.each do |path|
      begin
        File.write \
          "#{options.destination}/#{File.basename(path, ".*")}.html",
          Tilt.new(path).render
      rescue RuntimeError, Errno::ENOENT => e
        warn "WARN: wormwood build error: #{e.message}"
      end
    end
  end

end
