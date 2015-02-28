class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "images", "users", name: "images_user_id_fk"
    add_foreign_key "taggings", "images", name: "taggings_image_id_fk"
    add_foreign_key "taggings", "tags", name: "taggings_tag_id_fk"
  end
end
