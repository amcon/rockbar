class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.string :name, null: false, default: ""
  		t.string :profile_image_id
  		t.text :description, null: false, limit: 100
  		t.date :date, null: false
  		t.time :start_time, null: false
  		t.time :end_time, null: false
  		t.string :hosted_by
  		t.string :dj
  		t.string :drink_specials
  		t.string :cover_charge, default: "No Cover"
  		t.string :event_type
  		t.string :event_link

      t.timestamps
    end
  end
end

