class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :student
  validates :comment, length: { minimum: 20 }, presence: true
  validates :rating, presence: true
  validates :booking_id, presence: true, uniqueness: true
end
