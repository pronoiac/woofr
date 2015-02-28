class Tag < ActiveRecord::Base
  
  validates :name, presence: true

  has_many(
    :taggings,
    class_name: "Tagging",
    foreign_key: :tag_id,
    primary_key: :id
  )
  
  
end
