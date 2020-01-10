class SpokenLanguagesController < ApplicationController
  def new
    @spoken_language = SpokenLanguage.new
  end

  def create
    @spoken_language = SpokenLanguage.new(language_id: params[:spoken_language][:language_id].to_i, tutor_id: params[:spoken_language][:tutor_id].to_i)
    @spoken_language.save

    if @spoken_language.save
      redirect_to tutor_path(current_tutor.id)
    end
  end
end
