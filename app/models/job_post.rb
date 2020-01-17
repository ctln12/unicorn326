class JobPost < ApplicationRecord
  belongs_to :student

  validates :title, presence: true
  validates :description, presence: true
  validates :currency, presence: true
  validates :amount, presence: true
  validates :subjects, presence: true
  validates :spoken_languages, presence: true
end
