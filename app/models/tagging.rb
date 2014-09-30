class Tagging < ActiveRecord::Base
  
  validates :tag_id, :image_id, presence: true
  validates_uniqueness_of :tag_id, :scope => [:image_id]
  
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
