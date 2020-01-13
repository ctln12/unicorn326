class TutorsController < ApplicationController
  before_action :authenticate_student!, only: [:show]

  def index
    if params[:subject_id].present?
      @tutors = []
      taught_lessons = TaughtLesson.where(subject_id: params[:subject_id])
      taught_lessons.each do |taught_lesson|
        @tutors << taught_lesson.tutor
      end
      @tutors
    elsif params[:language_id].present?
      @tutors = []
      spoken_languages = SpokenLanguage.where(language_id: params[:language_id])
      spoken_languages.each do |spoken_language|
        @tutors << spoken_language.tutor
      end
      @tutors
    elsif params[:country].present?
      country_code = ISO3166::Country.find_country_by_name(params[:country].first).alpha2
      @tutors = Tutor.where(country: country_code)
    else
      @tutors = Tutor.all
    end
  end

  def show
    @tutor = Tutor.find(params[:id])
  end
end
