class JobPost < ApplicationRecord
  belongs_to :student
  belongs_to :language
  belongs_to :subject

  validates :title, presence: true
  validates :description, presence: true
  validates :currency, presence: true
  validates :amount, presence: true
  validates :subject_id, presence: true
  validates :language_id, presence: true
end
