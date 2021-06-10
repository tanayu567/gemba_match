class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      @spot = @comment.spot
      @comments = @spot.comments.includes(:user)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], spot_id: params[:spot_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
