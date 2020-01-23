class JobPostsController < ApplicationController
  before_action :authenticate_student!, only: :new

  def index
    if params[:subject_id].nil? && params[:language_id].nil? && params[:currency].nil?
      @job_posts = JobPost.all
    else
      subject = Subject.find(params[:subject_id].to_i).name unless params[:subject_id] == ''
      language = Language.find(params[:language_id].to_i).name unless params[:language_id] == ''
      currency = Currency.find(params[:currency_id]) unless params[:currency_id] == ''
      if params[:subject_id] == '' && params[:language_id] == '' && params[:currency] == ''
        @job_posts = JobPost.all
      elsif params[:language_id] == '' && params[:currency] == ''
        @job_posts = JobPost
                  .joins(:subject)
                  .where(['subjects.name = ?', subject])
      elsif params[:subject_id] == '' && params[:currency] == ''
        @job_posts = JobPost
                  .joins(:language)
                  .where(['languages.name = ?', language])
      elsif params[:subject_id] == '' && params[:language_id] == ''
        @job_posts = JobPost
                  .where(['currency = ?', currency])
      elsif params[:currency] == ''
        @job_posts = JobPost
                  .joins(:subject, :language)
                  .where(['subjects.name = ? and languages.name = ?', subject, language])
      elsif params[:language_id] == ''
        @job_posts = JobPost
                  .joins(:subject)
                  .where(['subjects.name = ? and currency = ?', subject, currency])
      elsif params[:subject_id] == ''
        @job_posts = JobPost
                  .joins(:language)
                  .where(['languages.name = ? and currency = ?', language, currency])
      else
        @job_posts = JobPost
                  .joins(:subject, :language)
                  .where(['subjects.name = ? and languages.name = ? and currency = ?', subject, language, currency])
      end
    end
    @job_posts_nb = @job_posts.count
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
    params.require(:job_post).permit(:title, :description, :amount, :currency, :subject_id, :language_id)
  end
end
