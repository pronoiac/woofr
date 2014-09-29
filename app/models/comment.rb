class Comment < ActiveRecord::Base
  
  validates :user_id, :image_id, :body, presence: true
  
end