class MessagesController < ApplicationController
  before_action :load_entities

  def create
    @messages = @chat.messages

    @username = current_student.first_name || current_tutor.first_name

    @message = Message.create(content: params.dig(:message, :content), username: @username, chat: @chat)
  end

  protected

  def load_entities
    @chat = Chat.find(params.dig(:message, :chat_id))
  end

  def messages_params
    params.require(:chat).permit(:content, :username, :chat_id)
  end
end
