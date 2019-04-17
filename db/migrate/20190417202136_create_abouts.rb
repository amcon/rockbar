class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :about do |t|
    	t.text :description, null: false

      t.timestamps
    end
  end
end
