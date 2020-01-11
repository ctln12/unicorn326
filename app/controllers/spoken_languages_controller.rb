class SpokenLanguagesController < ApplicationController
  def new
    @spoken_language = SpokenLanguage.new
  end

  def create
    @tutor = Tutor.find(current_tutor.id)
    params[:language_id].each do |language|
      @spoken_language = SpokenLanguage.new(language_id: language, tutor_id: @tutor.id)
      @spoken_language.save
    end

    redirect_to tutor_path(current_tutor.id) if @spoken_language.save
  end
end
