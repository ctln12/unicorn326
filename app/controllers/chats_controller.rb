class ChatsController < ApplicationController
  before_action :redirect_if_user_not_signed_in!, only: :index
  before_action :load_entities

  def index
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chats_params)

    if @chat.save
      flash[:success] = "Room was created successfully"
      redirect_to chats_path
    else
      render :new
    end
  end

  def show
    @message = Message.new(chat: @chat)
    @messages = @chat.messages
  end

  protected

  def load_entities
    @chats = Chat.all
    @chat = Chat.find(params[:id]) if params[:id]
  end

  def chats_params
    params.require(:chat).permit(:student_id, :tutor_id)
  end

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end
