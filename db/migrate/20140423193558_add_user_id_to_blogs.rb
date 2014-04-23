class AddUserIdToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs , :user_id , :integer
  	add_index :blogs , :user_id 
  	remove_column :blogs , :name
  end
end
