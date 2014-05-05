require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  	test "should get show" do
    	get :show, id: users(:test).profile_name
    	assert_response :success
  		assert_template 'profiles/show'
  	end

  	test "should render 404 if profile name not found" do 
  		get :show, id: "not found"
  		assert_response :not_found
  	end

  	test "that variables are assigned on succesfull profile viewing" do 
    	get :show, id: users(:test).profile_name
  		assert assigns(:user)
  		assert_not_empty assigns(:blogs)
  	end

  	test "only shows correct user's blogs" do 
  		get :show, id: users(:test).profile_name
  		assigns(:blogs).each do |blog|
  			assert_equal users(:test), blog.user
  		end
  	end
end
