class Photo < ApplicationRecord
	
	belongs_to :admin_user
	belongs_to :photo_album

	validates :title, length: { maximum: 255 }

end
