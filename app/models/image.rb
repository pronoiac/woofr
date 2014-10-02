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
  
  def self.load_metadata(image)
    metadata_url = image.filepicker_url + "/metadata?width=true&height=true"
    res = RestClient.get metadata_url
    if res.code == 200
      hash = JSON.parse res # .body?
      # fail
      image.width = hash["width"]
      image.height = hash["height"]
      return true
    end
    return false
  end
end
