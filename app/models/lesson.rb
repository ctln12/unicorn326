class Lesson < ApplicationRecord
  belongs_to :booking

  validates :booking_id, presence: true, uniqueness: true
end
