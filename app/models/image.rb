class Image < ActiveRecord::Base
  #attr_accessible :filepicker_url
  
  validates :filepicker_url, presence: true
  
  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many(
    :taggings,
    class_name: "Tagging",
    foreign_key: :image_id,
    primary_key: :id
  )
  
  
end
