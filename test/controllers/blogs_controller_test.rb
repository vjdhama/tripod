require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
    setup do
       @blog = blogs(:one)
    end

    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:blogs)
    end

    test "should be redirected when not logged in" do
        get :new
        assert_response :redirect
        assert_redirected_to new_user_session_path
    end

    test "should render the new page when logged in" do
        sign_in users(:test)
        get :new
        assert_response :success
    end

    test "should be logged in to post a blog" do
        post :create, blog: {content: "hello blog!!", title: "Test"}
        assert_response :redirect
        assert_redirected_to new_user_session_path
    end

    test "should create blog when logged in" do
        sign_in users(:test)
        assert_difference('Blog.count') do
            post :create, blog: { content: @blog.content, title: @blog.title }
        end

        assert_redirected_to blog_path(assigns(:blog))
    end

    test "should show blog" do
        get :show, id: @blog
        assert_response :success
    end

    test "should get redirected when not logged in" do
        get :edit, id: @blog
        assert_response :redirect
        assert_redirected_to new_user_session_path
    end


    test "should get edit when logged in" do
        sign_in users(:test)
        get :edit, id: @blog
        assert_response :success
    end

    test "should redirect blog update when not logged in" do sign_in users(:test)
        patch :update, id: @blog, blog: { content: @blog.content, title: @blog.title }
        assert_response :redirect
        assert_redirected_to new_user_session_path
    end


    test "should update blog when logged in" do
        sign_in users(:test)
        patch :update, id: @blog, blog: { content: @blog.content, title: @blog.title }
        assert_redirected_to blog_path(assigns(:blog))
    end

    test "should destroy blog" do
        assert_difference('Blog.count', -1) do
            delete :destroy, id: @blog
        end

        assert_redirected_to blogs_path
    end
end
