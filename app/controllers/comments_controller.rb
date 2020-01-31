class CommentsController < ApplicationController
  def create
    @job_post = JobPost.find(params[:job_post_id])
    @comment = @job_post.comments.create(params[:comment].permit(:content))
    @comment.tutor_id = current_tutor.id
    if @comment.save
      redirect_to job_post_path(@job_post)
    else
      render 'new'
    end
  end

  def edit
    @job_post = JobPost.find(params[:job_post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @job_post = JobPost.find(params[:job_post_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to job_post_path(@job_post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @job_post = JobPost.find(params[:job_post_id])
    @comment.destroy
    redirect_to job_post_path(@job_post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
