class Event < ApplicationRecord

	serialize :recurring, Hash

	has_many :event_exceptions, dependent: :destroy

	# scope :next_five_events, lambda { where(date: >= Date.today).order(date: :asc).limit(5) }

	scope :sorted, lambda { order(date: :asc).order(start_time: :asc) }

	mount_uploader :profile_image_id, PhotoUploader

	def recurring=(value)
		if RecurringSelect.is_valid_rule?(value)
			super(RecurringSelect&.dirty_hash_to_rule(value)&.to_hash)
		else
			super(nil)
		end
	end

	def rule
		IceCube::Rule.from_hash recurring
	end

	def schedule(start)
		schedule = IceCube::Schedule.new(start)
		schedule.add_recurrence_rule(rule)

		event_exceptions.each do |exception|
			schedule.add_exception_time(exception.date)
		end
		schedule
	end

	def calendar_events(start)
		if recurring.empty? || recurring == nil
			[self]
		else
			# start_date = start.beginning_of_month.beginning_of_week
			end_date = self.end_date.present? ? self.end_date : start.end_of_month.end_of_week 
			schedule(date).occurrences(end_date).map do |date|
				Event.new(id: id, date: date, title: title, start_time: start_time, end_time: end_time, profile_image_id: profile_image_id)
			end
		end
	end

	def next_four_events
		events.order(date: :asc).select { |e| e.date >= Date.today }.limit(4)
	end

	def photo_url
		@calendar_events = self.calendar_events(self.start_time)
		@calendar_events.each do |event|
			if event.profile_image_id_url.blank?
				photo_url = Event.find(event.id).profile_image_id_url
				return photo_url
			else
				return event.profile_image_id
			end	
		end
	end

	validates_presence_of :title, :description, :date, :start_time, :end_time
	validates_length_of :title, maximum: 255
	validates_length_of :description, minimum: 10

end
