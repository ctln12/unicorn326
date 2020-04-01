class Chat < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  has_many :messages, dependent: :destroy

  validates :student_id, presence: true
  validates :tutor_id, presence: true
  validates :student_id, uniqueness: { scope: :tutor_id, message: "and tutor should be a unique combination for each chat" }
end
