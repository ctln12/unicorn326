class Currency < ApplicationRecord
  has_many :tutors
  has_many :job_posts
  has_many :wallets, through: :tutors
end
