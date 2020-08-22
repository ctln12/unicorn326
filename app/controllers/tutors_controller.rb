class TutorsController < ApplicationController
  before_action :authenticate_student!, only: [:show]
  before_action :authenticate_tutor!, only: [:profile]

  def index
    if params[:subject].present? || params[:language].present? || params[:country].present?
      sql_queries = []
      sql_queries << "subjects.name = :subject" unless params[:subject].empty?
      sql_queries << "languages.name = :language" unless params[:language].empty?
      unless params[:country].empty?
        country_code = ISO3166::Country.find_country_by_name(params[:country]).alpha2
        sql_queries << "tutors.country = :country"
      end
      sql_query = sql_queries.join(" AND ")
      @tutors = Tutor.joins(:subjects).joins(:languages).where(sql_query, subject: params[:subject], language: params[:language], country: country_code).uniq
    else
      @tutors = Tutor.all
    end
    @tutors_nb = @tutors.count
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  def profile
    @tutor = current_tutor
  end
end
