class RenameAboutToDescription < ActiveRecord::Migration[5.2]
  def change
  	rename_table :about, :descriptions
  end
end
