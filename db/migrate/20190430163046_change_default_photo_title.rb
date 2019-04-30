class ChangeDefaultPhotoTitle < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(
	  :photos,
	  :title,
	  from: "",
	  to: "Photo"
	)
  end
end
