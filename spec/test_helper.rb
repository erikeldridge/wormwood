require 'minitest/autorun'
require 'minitest/pride'
require 'fileutils'
require 'ostruct'
require_relative '../lib/wormwood.rb'

def clear_dest!
  FileUtils.rm_rf(dest_dir)
  FileUtils.mkdir_p(dest_dir)
end

def create_source_dir!
  FileUtils.mkdir_p(source_dir) unless File.exists? source_dir
end

def create_layout!
  File.write(source_dir('layout.erb'), "<%= content %>")
end

def create_template!
  File.write(source_dir('foo.erb'), "asd")
end

# ref: https://github.com/mojombo/jekyll/blob/master/test/helper.rb
def dest_dir(*subdirs)
  File.join(File.dirname(__FILE__), 'tmp/dest', *subdirs)
end

def source_dir(*subdirs)
  File.join(File.dirname(__FILE__), 'tmp/source', *subdirs)
end
