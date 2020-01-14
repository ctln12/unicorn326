class TutorsController < ApplicationController
  before_action :authenticate_student!, only: [:show]

  def index
    if params[:subject_id].nil? && params[:language_id].nil? && params[:country].nil?
      @tutors = Tutor.all
    else
      subject = Subject.find(params[:subject_id].to_i).name unless params[:subject_id] == ''
      language = Language.find(params[:language_id].to_i).name unless params[:language_id] == ''
      country_code = ISO3166::Country.find_country_by_name(params[:country]).alpha2 unless params[:country] == ''
      if params[:subject_id] == '' && params[:language_id] == '' && params[:country] == ''
        @tutors = Tutor.all
      elsif params[:language_id] == '' && params[:country] == ''
        @tutors = Tutor
                  .joins(:subjects)
                  .where(['subjects.name = ?', subject])
      elsif params[:subject_id] == '' && params[:country] == ''
        @tutors = Tutor
                  .joins(:languages)
                  .where(['languages.name = ?', language])
      elsif params[:subject_id] == '' && params[:language_id] == ''
        @tutors = Tutor
                  .where(['country = ?', country_code])
      elsif params[:country] == ''
        @tutors = Tutor
                  .joins(:subjects, :languages)
                  .where(['subjects.name = ? and languages.name = ?', subject, language])
      elsif params[:language_id] == ''
        @tutors = Tutor
                  .joins(:subjects)
                  .where(['subjects.name = ? and country = ?', subject, country_code])
      elsif params[:subject_id] == ''
        @tutors = Tutor
                  .joins(:languages)
                  .where(['languages.name = ? and country = ?', language, country_code])
      else
        @tutors = Tutor
                  .joins(:subjects, :languages)
                  .where(['subjects.name = ? and languages.name = ? and country = ?', subject, language, country_code])
      end
    end
    @tutors_nb = @tutors.count
  end

  def show
    @tutor = Tutor.find(params[:id])
  end
end
