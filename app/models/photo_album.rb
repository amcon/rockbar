class PhotoAlbum < ApplicationRecord

	has_many :photos

	scope :newest_first, lambda { order{"created_at DESC"} }
	
end
