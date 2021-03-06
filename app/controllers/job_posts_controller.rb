class JobPostsController < ApplicationController
  before_action :authenticate_student!, only: :new

  def index
    if params[:subject_id].nil? && params[:language_id].nil? && params[:currency_id].nil?
      @job_posts = JobPost.all
    else
      subject = Subject.find(params[:subject_id].to_i).name unless params[:subject_id] == ''
      language = Language.find(params[:language_id].to_i).name unless params[:language_id] == ''
      currency = Currency.find(params[:currency_id].to_i).name unless params[:currency_id] == ''
      if params[:subject_id] == '' && params[:language_id] == '' && params[:currency_id] == ''
        @job_posts = JobPost.all
      elsif params[:language_id] == '' && params[:currency_id] == ''
        @job_posts = JobPost
                  .joins(:subject)
                  .where(['subjects.name = ?', subject])
      elsif params[:subject_id] == '' && params[:currency_id] == ''
        @job_posts = JobPost
                  .joins(:language)
                  .where(['languages.name = ?', language])
      elsif params[:subject_id] == '' && params[:language_id] == ''
        @job_posts = JobPost
                  .joins(:currency)
                  .where(['currencies.name = ?', currency])
      elsif params[:currency_id] == ''
        @job_posts = JobPost
                  .joins(:subject, :language)
                  .where(['subjects.name = ? and languages.name = ?', subject, language])
      elsif params[:language_id] == ''
        @job_posts = JobPost
                  .joins(:subject, :currency)
                  .where(['subjects.name = ? and currencies.name = ?', subject, currency])
      elsif params[:subject_id] == ''
        @job_posts = JobPost
                  .joins(:language, :currency)
                  .where(['languages.name = ? and currencies.name = ?', language, currency])
      else
        @job_posts = JobPost
                  .joins(:subject, :language, :currency)
                  .where(['subjects.name = ? and languages.name = ? and currencies.name = ?', subject, language, currency])
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
    redirect_to job_post_path(@job_post)
  end

  def edit
    @job_post = JobPost.find(params[:id])
  end

  def update
    @job_post = JobPost.find(params[:id])
    @job_post.update(job_post_params)
    redirect_to job_post_path(@job_post)
  end

  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    redirect_to job_posts_path
  end

  private

  def job_post_params
    params.require(:job_post).permit(:title, :description, :price, :currency_id, :subject_id, :language_id)
  end
end
