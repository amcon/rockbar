class EventException < ApplicationRecord
  belongs_to :event

  validates :date, presence: true
end
