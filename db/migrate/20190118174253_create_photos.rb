class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
    	t.references :photo_album, index: true, forgeign_key: true
    	t.string :name, null: false, default: ""
  		t.string :photo_image_id

      t.timestamps
    end
  end
end
