class Subject < ApplicationRecord
  has_many :taught_lessons
  has_many :job_posts
  has_many :bookings
end
