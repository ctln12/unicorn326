class Message < ApplicationRecord
  belongs_to :chat

  def as_json(options)
    super(options).merge(user_avatar_url: "https://kitt.lewagon.com/placeholder/users/ssaunier")
  end
end
