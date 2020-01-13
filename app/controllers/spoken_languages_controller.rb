class SpokenLanguagesController < ApplicationController
  def index
    @spoken_languages = SpokenLanguage.all
  end

  def new
    @spoken_language = SpokenLanguage.new
  end

  def create
    params[:language_id].each do |language|
      @spoken_language = SpokenLanguage.new(language_id: language, tutor_id: current_tutor.id)
      @spoken_language.save
    end
    redirect_to tutor_path(current_tutor)
  end

  def edit
    @spoken_language = SpokenLanguage.find(params[:id])
  end

  def update
    @spoken_language = SpokenLanguage.find(params[:id])
    @spoken_language.update(spoken_language_params)
    redirect_to tutor_path(current_tutor)
  end

  def destroy
    @spoken_language = SpokenLanguage.find(params[:id])
    @spoken_language.destroy
    redirect_to tutor_path(current_tutor)
  end

  private

  def spoken_language_params
    params.require(:spoken_language).permit(:language_id)
  end
end
