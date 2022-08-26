class Photo < ApplicationRecord

	mount_uploader :photo_image_id, PhotoUploader

	belongs_to :photo_album

	validates :title, length: { maximum: 255 }

end
