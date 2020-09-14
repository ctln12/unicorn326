class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  belongs_to :language

  has_many :reviews
  has_one :lesson

  validates :date, :start_time, :end_time, :booking_price, presence: true
end
