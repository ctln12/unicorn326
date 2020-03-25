class MessagesController < ApplicationController
  before_action :load_entities

  def create
    @messages = @chat.messages

    if student_signed_in?
      @user = @chat.student
    elsif tutor_signed_in?
      @user = @chat.tutor
    end

    @message = Message.create(content: params.dig(:message, :content), is_student: @user == current_student, chat: @chat)

    ChatChannel.broadcast_to @chat, @message
  end

  protected

  def load_entities
    @chat = Chat.find(params.dig(:message, :chat_id))
  end

  def messages_params
    params.require(:chat).permit(:content, :is_student, :chat_id)
  end
end
