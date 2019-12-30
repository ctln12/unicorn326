class PagesController < ApplicationController
  skip_before_action :authenticate_tutor!, only: [:home]

  def home
  end
end
