class AddRecurringToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :recurring, :text
  end
end
