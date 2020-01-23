class JobPost < ApplicationRecord
  belongs_to :student

  validates :title, presence: true
  validates :description, presence: true
  validates :currency, presence: true
  validates :amount, presence: true
  validates :subject_id, presence: true
  validates :language_id, presence: true
end
