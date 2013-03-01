require 'minitest/autorun'
require 'minitest/pride'
require 'fileutils'
require 'ostruct'
require_relative '../lib/wormwood.rb'

def create_source
  unless File.exists? source_dir
    FileUtils.mkdir_p(source_dir)
    File.write(source_dir('layout.erb'), "<%= content %>")
    File.write(source_dir('foo.erb'), "asd")
  end
end

# ref: https://github.com/mojombo/jekyll/blob/master/test/helper.rb
def dest_dir(*subdirs)
  File.join(File.dirname(__FILE__), 'tmp/dest', *subdirs)
end

def source_dir(*subdirs)
  File.join(File.dirname(__FILE__), 'tmp/source', *subdirs)
end

def clear_dest
  FileUtils.rm_rf(dest_dir)
  FileUtils.mkdir_p(dest_dir)
end
