require_relative '../../test_helper'
describe Wormwood do
  before do
    clear_dest!
    create_source_dir!
    create_template!
  end

  it "generates default layout" do
    Wormwood.build \
      [source_dir("foo.erb")],
      OpenStruct.new({
        'source' => source_dir,
        'destination' => dest_dir,
        'layout' => 'layout',
        'variable' => 'content'
      })
    assert File.exist?(source_dir('layout.erb'))
  end

  it "writes to the correct destination" do
    create_layout!
    Wormwood.build \
      [source_dir("foo.erb")],
      OpenStruct.new({
        'source' => source_dir,
        'destination' => dest_dir,
        'layout' => 'layout',
        'variable' => 'content'
      })
    assert File.exist?(dest_dir('foo.html'))
    assert "asd" == File.read(dest_dir('foo.html'))
  end
end
