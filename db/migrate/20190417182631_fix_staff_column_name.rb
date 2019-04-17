class FixStaffColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :staffs, :name, :title
  end
end
