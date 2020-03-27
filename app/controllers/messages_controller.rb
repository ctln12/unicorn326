class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @new_message = Message.new(content: params.dig(:message, :content), chat: @chat)
    @new_message.is_student = student_signed_in?
    @new_message.save
  end
end
