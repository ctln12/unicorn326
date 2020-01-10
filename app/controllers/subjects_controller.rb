class SubjectsController < ApplicationController
  skip_before_action :authenticate_student!, only: :index
  skip_before_action :authenticate_tutor!, only: :index
  def index
    @subjects = Subject.all
  end
end
