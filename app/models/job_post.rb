class JobPost < ApplicationRecord
  belongs_to :student
  belongs_to :language
  belongs_to :subject
  belongs_to :currency

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :currency_id, presence: true
  validates :price, presence: true
  validates :subject_id, presence: true
  validates :language_id, presence: true
end
