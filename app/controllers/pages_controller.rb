class PagesController < ApplicationController
  skip_before_action :authenticate_student!, only: [:home]
  skip_before_action :authenticate_tutor!, only: [:home]

  def home
  end
end
