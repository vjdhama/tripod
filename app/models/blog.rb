class Blog < ActiveRecord::Base
	
	belongs_to :user

	validates :title, presence: true

	validates :content, presence: true,
	                    length: {
	                    	minimum: 2
	                    }

	validates :user_id, presence: true
end
