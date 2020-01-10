class TutorsController < ApplicationController
  before_action :authenticate_tutor!, only: :show
  def show
    @tutor = Tutor.find(params[:id])
  end
end
