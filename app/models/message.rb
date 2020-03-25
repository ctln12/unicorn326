class Message < ApplicationRecord
  belongs_to :chat

  validates :content, presence: true
  validates :is_student, inclusion: { in: [ true, false ] }
  validates :chat_id, presence: true

  def author
    chat = Chat.find(chat_id)
    if is_student
      return chat.student
    else
      return chat.tutor
    end
  end

  def as_json(options)
    super(options).merge(user_avatar_url: "https://kitt.lewagon.com/placeholder/users/ssaunier")
  end
end
