class ChatsController < ApplicationController
  before_action :redirect_if_user_not_signed_in!, only: :index

  def index
  end

  private

  def redirect_if_user_not_signed_in!
    redirect_to root_path unless tutor_signed_in? || student_signed_in?
  end
end
