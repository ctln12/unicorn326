class TaughtLesson < ApplicationRecord
  belongs_to :subject
  belongs_to :tutor

  validates :subject_id, presence: true, uniqueness: { scope: :tutor_id }
  validates :tutor_id, presence: true
end
