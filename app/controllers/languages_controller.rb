class LanguagesController < ApplicationController
  skip_before_action :authenticate_student!, :authenticate_tutor!, only: :index
  def index
    @languages = Language.all
  end
end
