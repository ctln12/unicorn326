class TutorsController < ApplicationController
  before_action :authenticate_student!, only: [:show]

  def index
    @tutors = Tutor.all
  end

  def show
    @tutor = Tutor.find(params[:id])
  end
end
