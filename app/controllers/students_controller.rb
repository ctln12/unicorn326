class StudentsController < ApplicationController
  before_action :authenticate_student!, only: :show
  def show
  end
end
