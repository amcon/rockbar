class Event < ApplicationRecord

	attr_accessor :name

	# scope :next_five_events, lambda { where(date: >= Date.today).order(date: :asc).limit(5) }

	scope :sorted, lambda { order(date: :asc) }

	def next_five_events
		events.order(date: :asc).select { |e| e.date >= Date.today }.limit(5)
	end

	validates_presence_of :title, :description, :date, :start_time, :end_time

end
