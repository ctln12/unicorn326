class TaughtLessonsController < ApplicationController
  def index
    @taught_lessons = TaughtLesson.all
  end

  def new
    @taught_lesson = TaughtLesson.new
  end

  def create
    params[:subject_id].each do |subject|
      @taught_lesson = TaughtLesson.new(subject_id: subject, tutor_id: current_tutor.id)
      @taught_lesson.save
    end
    redirect_to tutor_path(current_tutor)
  end

  def edit
    @taught_lesson = TaughtLesson.find(params[:id])
  end

  def update
    @taught_lesson = TaughtLesson.find(params[:id])
    @taught_lesson.update(taught_lesson_params)
    redirect_to tutor_path(current_tutor)
  end

  def destroy
    @taught_lesson = TaughtLesson.find(params[:id])
    @taught_lesson.destroy
    redirect_to tutor_path(current_tutor)
  end

  private

  def taught_lesson_params
    params.require(:taught_lesson).permit(:subject_id)
  end
end
