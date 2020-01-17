class BookingsController < ApplicationController
  before_action :authenticate_tutor!, only: :index
  def index
  end
end
