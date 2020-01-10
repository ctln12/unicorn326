class TaughtLessonsController < ApplicationController
  skip_before_action :authenticate_student!

  def index
    @taught_lesson = TaughtLesson.all
  end

  def new
    @tutor = Tutor.find(current_tutor.id)
    @taught_lesson = TaughtLesson.new
  end

  def create
    @taught_lesson = TaughtLesson.new(taught_lesson_params)
    @tutor = Tutor.find(params[current_user])
    @taught_lesson.save
  end

  def edit
    @taught_lesson = TaughtLesson.find(params[current_user])
  end

  def update
    @taught_lesson = TaughtLesson.find(params[:id])
    @taught_lesson.update(params[:taught_lesson])
  end

  private

  def taught_lesson_params
    params.require(:taught_lesson).permit(:subject_id)
  end
end
