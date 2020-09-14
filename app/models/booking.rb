class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  belongs_to :language

  has_many :reviews, dependent: :destroy
  has_one :lesson, dependent: :destroy

  validates :date, :start_time, :end_time, :booking_price, presence: true
end
