class CreateEventExceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :event_exceptions do |t|
      t.references :event, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
