require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = Post.new(title: 'hello', photo: 'url', content: 'lorem')
  end

  test 'should be valid if all fields are set' do
    assert @post.valid?
  end

  test "should be invalid if title is not present" do
    @post.title = nil

    assert_not @post.valid?
  end

  test "should be invalid if photo is not present" do
    @post.photo = nil

    assert_not @post.valid?
  end

  test "should be invalid if content is not present" do
    @post.content = nil

    assert_not @post.valid?
  end
end
