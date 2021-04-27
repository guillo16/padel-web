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

  test "user should update Post" do
    patch post_path(@post) , params: {
      post: { title: "This is the new title" }
    }

    assert_equal "This is the new title", Post.find(@post.id).title
  end

  test "user should be able to destroy a Post" do
    assert_difference "Post.count", -1 do
      delete post_path(@post)
    end
  end

  test "user should not be able to destroy a Post if logout" do
    logout
    assert_difference "Post.count", 0 do
      delete post_path(@post)
    end
  end
end
