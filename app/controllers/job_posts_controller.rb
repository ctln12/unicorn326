class JobPostsController < ApplicationController
  def index
    @job_posts = JobPost.all
  end

  def new
    @job_post = JobPost.new
  end

  def create

  end

end
