class SubjectsController < ApplicationController
  skip_before_action :authenticate_student!, :authenticate_tutor!, only: :index
  def index
    @subjects = Subject.all
  end
end
