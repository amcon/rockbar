class PhotoAlbum < ApplicationRecord

	has_many :photos

	scope :newest_first, lambda { order(created_at: :desc) }

	mount_uploader :album_image_id, PhotoUploader

	validates_presence_of :title, :description
	validates_length_of :title, maximum: 255
	validates_length_of :description, within: 10..50

end
