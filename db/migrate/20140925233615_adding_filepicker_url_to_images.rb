class AddingFilepickerUrlToImages < ActiveRecord::Migration
  def change
    add_column :images, :filepicker_url, :string
  end
end
