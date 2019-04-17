class CreateStaff < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
    	t.string :name, null: false, default: ""
  		t.string :staff_image_id
  		t.text :description, null: false, limit: 50

      t.timestamps
    end
  end
end
