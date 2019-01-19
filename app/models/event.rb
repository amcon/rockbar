class Event < ApplicationRecord

	attr_accessor :name

	# scope :next_five_events, lambda { where(date: >= Date.today).order(date: :asc).limit(5) }

	def next_five_events
		events.order(date: :asc).select { |e| e.date >= Date.today }.limit(5)
	end

end
