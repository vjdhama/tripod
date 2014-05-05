require 'test_helper'

class BlogTest < ActiveSupport::TestCase

	test "that title should exist" do 
		blog = Blog.new
		assert !blog.save
		assert !blog.errors[:title].empty?
	end


	test "that content should exist" do 
		blog = Blog.new
		assert !blog.save
		assert !blog.errors[:content].empty?
	end

	test "that content should have atleast 2 characters" do 
		blog = Blog.new
		blog.content = "H"
		assert !blog.save
		assert !blog.errors[:content].empty?
	end

	test "that blog has a user id" do 
		blog = Blog.new
		blog.content = "Hello"
		assert !blog.save
		assert !blog.errors[:user_id].empty?
	end
end