class SpokenLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :tutor

  validates :language_id, presence: true, uniqueness: { scope: :tutor_id }
  validates :tutor_id, presence: true
end
