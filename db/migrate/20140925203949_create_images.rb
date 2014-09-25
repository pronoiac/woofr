class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :description
      t.string :user_id, null: false

      t.timestamps
    end
    
    add_index :images, :user_id
  end
end
