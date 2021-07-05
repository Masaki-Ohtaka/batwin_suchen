class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @comment = current_user.comments.build(comment_params) 
      @comment.job_change_dog_id = params[:job_change_dog_id]    
    elsif foundation_signed_in?
      @comment = current_foundation.comments.build(comment_params)
      @comment.job_change_dog_id = params[:job_change_dog_id]
    end

  if @comment.save 
    if @comment.user_id.present? 
      comment = { text: @comment.text ,user_name: @comment.user.nickname }
    else
      comment = { text: @comment.text ,user_name: @comment.foundation.facility_name }
    end
      ActionCable.server.broadcast 'message_channel', content: comment
    # redirect_to job_change_dog_path(@comment.job_change_dog_id)
  else
    @job_change_dog = @comment.job_change_dog
    @comments = @job_change_dog.comments
    render "job_change_dogs/show"
  end
end

  private
  def comment_params
    params.require(:comment).permit(:text, :job_change_dog_id)#.merge(foundation_id: current_foundation.id, job_change_dog_id: params[:job_change_dog_id])
  end
end
