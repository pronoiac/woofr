class Tagging < ActiveRecord::Base
  
  validates :tag_id, :image_id, presence: true
  
  belongs_to(
    :tag,
    class_name: "Tag",
    foreign_key: :tag_id,
    primary_key: :id
  )
  
  def name 
    tag.name
  end
  
end
