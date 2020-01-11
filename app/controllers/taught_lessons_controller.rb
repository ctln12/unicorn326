class TaughtLessonsController < ApplicationController
  def index
    @taught_lessons = TaughtLesson.all
  end

  def new
    @tutor = Tutor.find(current_tutor.id)
    @taught_lesson = TaughtLesson.new
  end

  def create
    params[:subject_id].each do |subject|
      @taught_lesson = TaughtLesson.new(subject_id: subject, tutor_id: current_tutor.id)
      @taught_lesson.save
    end
    redirect_to root_path
  end

  def edit
    @taught_lesson = TaughtLesson.find(current_tutor.id)
  end

  def update
    @taught_lesson = TaughtLesson.find(params[:id])
    @taught_lesson.update(params[:taught_lesson])
  end

  private

  def taught_lesson_params
    params.require(:taught_lesson).permit(:subject, :tutor)
  end
end
