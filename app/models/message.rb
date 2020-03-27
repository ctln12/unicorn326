class Message < ApplicationRecord
  belongs_to :chat

  validates :content, presence: true
  validates :is_student, inclusion: { in: [ true, false ] }
  validates :chat_id, presence: true
end
