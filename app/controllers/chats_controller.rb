class ChatsController < ApplicationController
  def index
    @chats = load_chats
    if @chats.empty?
      @chat, @messages = []
    else
      @chat = @chats.first
      @messages = @chat.messages.order('created_at ASC')
    end
    @message = Message.new
  end

  def create
    @tutor = Tutor.find(params[:tutor_id])
    @new_chat = Chat.new(tutor: @tutor, student: current_student)

    if @new_chat.save
      redirect_to chat_path(@new_chat)
    elsif Chat.exists?(student_id: @new_chat.student_id, tutor_id: @new_chat.tutor_id)
      chat = Chat.where(student_id: @new_chat.student_id).where(tutor_id: @new_chat.tutor_id).first

      redirect_to chat_path(chat)
    else
      redirect_to tutor_path(@tutor)
    end
  end

  def show
    @chats = load_chats
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.order('created_at ASC')
    @message = Message.new
  end

  private

  def load_chats
    if student_signed_in?
      Chat.where(student_id: current_student.id)
    elsif tutor_signed_in?
      Chat.where(tutor_id: current_tutor.id)
    end
  end
end
