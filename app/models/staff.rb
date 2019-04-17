class Staff < ApplicationRecord
	scope :oldest_first, lambda { order(created_at: :asc) }

	mount_uploader :staff_image_id, PhotoUploader
end
