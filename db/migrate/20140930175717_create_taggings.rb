class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id, presence: true
      t.integer :image_id, presence: true
      
      t.timestamps
    end
    
    add_index :taggings, :tag_id
    add_index :taggings, :image_id
    add_index :taggings, [:image_id, :tag_id], unique: true
  end
end
