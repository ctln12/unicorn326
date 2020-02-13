class Review < ApplicationRecord
  belongs_to :booking
  validates :comment, length: { minimum: 20 }, presence: true
end
