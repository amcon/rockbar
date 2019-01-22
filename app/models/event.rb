class Event < ApplicationRecord

	belongs_to :admin_user

	# scope :next_five_events, lambda { where(date: >= Date.today).order(date: :asc).limit(5) }

	scope :sorted, lambda { order(date: :asc) }

	def next_five_events
		events.order(date: :asc).select { |e| e.date >= Date.today }.limit(5)
	end

	validates_presence_of :title, :description, :date, :start_time, :end_time
	validates_length_of :title, maximum: 255
	validates_length_of :description, within: 10..300

end
