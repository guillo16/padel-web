require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:first_user)
    @post = posts(:first_post)
    @post_params = { title: "New court open ", photo: "url", content: "lorem ipsun"}
  end

  test "should get index" do
    get posts_path

    assert_response :success
  end

  test "should get show" do
    get post_path(@post)

    assert_response :success
  end

  test "user should get new" do
    get new_post_path

    assert_response :success
  end

  test "user should get redirect if not login" do
    logout
    get new_post_path

    assert_response :redirect
  end

  test "user should create post" do
    assert_difference "Post.count", 1 do
      post posts_url, params: {
        post: {
          title: "New title",
          photo: "url",
          content: "New content"
        }
      }
    end
  end

  test "user should not be able to create post is title is not present" do
    assert_difference "Post.count", 0 do
      post posts_url, params: {
        post: { photo: "url", content: "New content" }
      }
    end
  end

  test "user should not be able to create post is photo is not present" do
    assert_difference "Post.count", 0 do
      post posts_url, params: {
        post: { title: "Some title", content: "New content" }
      }
    end
  end

  test "user should not be able to create post is content is not present" do
    assert_difference "Post.count", 0 do
      post posts_url, params: {
        post: { title: "Some title", photo: "url" }
      }
    end
  end

  test "user should get edit" do
    get edit_post_path(@post)

    assert_response :success
  end

  test "user should be redirect from edit if not login" do
    logout
    get edit_post_path(@post)

    assert_response :redirect
  end
end
