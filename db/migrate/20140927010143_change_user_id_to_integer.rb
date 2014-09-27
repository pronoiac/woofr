class ChangeUserIdToInteger < ActiveRecord::Migration
  def change
    change_column :images, :user_id, 'integer USING CAST(user_id AS integer)', null: false
  end
end
