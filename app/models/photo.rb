class Photo < ApplicationRecord

	attr_accessor :name

	belongs_to :photo_album

end
