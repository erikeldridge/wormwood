require_relative '../../test_helper'
describe Wormwood do
  before do
    clear_dest
    create_source
  end

  it "writes to the correct destination" do
    Wormwood.build \
      [source_dir("foo.erb")],
      OpenStruct.new({'source' => source_dir, 'destination' => dest_dir})
    assert File.exist?(dest_dir('foo.html'))
  end
end
