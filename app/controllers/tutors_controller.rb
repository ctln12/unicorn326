class TutorsController < ApplicationController
  before_action :authenticate_tutor!, only: :show
  def show
  end
end
