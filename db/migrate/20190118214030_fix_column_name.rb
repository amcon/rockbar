class FixColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :events, :name, :title
  	rename_column :photo_albums, :name, :title
  	rename_column :photos, :name, :title
  end
end
