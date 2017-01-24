class Event < ApplicationRecord
    scope :past_events, -> { where("event_date < ?", Time.now) }
    scope :future_events, -> { where("event_date > ?", Time.now) }
    belongs_to :creator, :class_name => "User"
    has_many :invitations, foreign_key: :attended_event_id
    has_many :attendees, through: :invitations
end
