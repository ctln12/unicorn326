class ChatsController < ApplicationController
  before_action :redirect_if_user_not_signed_in!, only: :index
  before_action :load_entities

  def create
    @chat = Chat.new(chats_params)

    if @chat.save
      flash[:success] = "Room was created successfully"
      redirect_to chat_path(@chat)

    elsif Chat.exists?(student_id: @chat.student_id, tutor_id: @chat.tutor_id)
      existing_chat = Chat.where(student_id: @chat.student_id).where(tutor_id: @chat.tutor_id).first

      redirect_to chat_path(existing_chat)
    else
      render "tutors/show"
    end
  end

  def show
    @message = Message.new(chat: @chat)
    @messages = @chat.messages
  end

  protected

  def load_entities
    if student_signed_in?
      @chats = Chat.where(student_id: current_student.id)
    else
      @chats = Chat.where(tutor_id: current_tutor.id)
    end
    @chat = Chat.find(params[:id]) if params[:id]
  end

  def chats_params
    params.require(:chat).permit(:student_id, :tutor_id)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end
