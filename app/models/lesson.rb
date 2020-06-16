class Lesson < ApplicationRecord
  belongs_to :booking

  validates :booking_id, presence: true, uniqueness: true
  validates :opentok_session_id, presence: true
  validates :opentok_token, presence: true
end
