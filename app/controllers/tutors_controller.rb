class TutorsController < ApplicationController
  before_action :authenticate_student!, only: [:show]

  def index
    subject = Subject.find(params[:subject_id].first.to_i).name unless params[:subject_id].nil?
    language = Language.find(params[:language_id].first.to_i).name unless params[:language_id].nil?
    country_code = ISO3166::Country.find_country_by_name(params[:country].first).alpha2 unless params[:country].nil?

    if params[:subject_id].present? && params[:language_id].present? && params[:country].present?
      @tutors = Tutor
                .joins(:subjects, :languages)
                .where(['subjects.name = ? and languages.name = ? and country = ?', subject, language, country_code])
    elsif params[:subject_id].present? && params[:language_id]
      @tutors = Tutor
                .joins(:subjects, :languages)
                .where(['subjects.name = ? and languages.name = ?', subject, language])
    elsif params[:subject_id].present? && params[:country].present?
      @tutors = Tutor
                .joins(:subjects)
                .where(['subjects.name = ? and country = ?', subject, country_code])
    elsif params[:language_id].present? && params[:country].present?
      @tutors = Tutor
                .joins(:languages)
                .where(['languages.name = ? and country = ?', language, country_code])
    elsif params[:subject_id].present?
      @tutors = Tutor
                .joins(:subjects)
                .where(['subjects.name = ?', subject])
    elsif params[:language_id].present?
      @tutors = Tutor
                .joins(:languages)
                .where(['languages.name = ?', language])
    elsif params[:country].present?
      @tutors = Tutor
                .where(['country = ?', country_code])
    else
      @tutors = Tutor.all
    end
    @tutors_nb = @tutors.count
  end

  def show
    @tutor = Tutor.find(params[:id])
  end
end
