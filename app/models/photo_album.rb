class PhotoAlbum < ApplicationRecord

	attr_accessor :name

	has_many :photos

	scope :newest_first, lambda { order(created_at: :desc) }

	validates_presence_of :title, :description

end
