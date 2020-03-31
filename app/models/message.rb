class Message < ApplicationRecord
  belongs_to :chat

  validates :content, presence: true
  validates :is_student, inclusion: { in: [ true, false ] }
  validates :chat_id, presence: true
  validates :author_id, presence: true

  def author
    unless is_student == nil
      if is_student
        Student.find(author_id)
      else
        Tutor.find(author_id)
      end
    end
  end
end
