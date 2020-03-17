class MessagesController < ApplicationController
  before_action :load_entities

  def create
    @messages = @chat.messages

    if student_signed_in?
      @user = @chat.student
    elsif tutor_signed_in?
      @user = @chat.tutor
    end

    @message = Message.create(content: params.dig(:message, :content), username: @user.first_name, chat: @chat)

    ChatChannel.broadcast_to @chat, @message
  end

  protected

  def load_entities
    @chat = Chat.find(params.dig(:message, :chat_id))
  end

  def messages_params
    params.require(:chat).permit(:content, :username, :chat_id)
  end
end
