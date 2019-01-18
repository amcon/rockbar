class CreatePhotoAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_albums do |t|
    	t.string :name, null: false, default: ""
  		t.string :album_image_id
  		t.text :description, null: false, limit: 50

      t.timestamps
    end
  end
end
