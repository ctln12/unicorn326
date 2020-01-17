class JobPostsController < ApplicationController
  def index
    @job_posts = JobPost.all
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(job_post_params)
    @job_post.student_id = current_student.id
    @job_post.save
    redirect_to job_posts_path
  end

  private

  def job_post_params
    params.require(:job_post).permit(:title, :description, :currency, :amount, :subjects, :spoken_languages)
  end
end
