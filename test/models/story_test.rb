require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  test "should not save Story without title" do
    story = Story.new
    assert_not story.save
  end
end
