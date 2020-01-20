class JobPostsController < ApplicationController
  before_action :authenticate_student!, only: :new
  def index
    @job_posts = JobPost.all
  end

  def show
    @job_post = JobPost.find(params[:id])
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

  def edit
    @job_post = JobPost.find(params[:id])
  end

  def update
    @job_post = JobPost.find(params[:id])
    @job_post.update(job_post_params)
    redirect_to job_posts_path
  end

  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    redirect_to edit_job_post_path
  end

  private

  def job_post_params
    params.require(:job_post).permit(:title, :description, :amount, currency: [], subjects: [], spoken_languages: [])
  end
end
