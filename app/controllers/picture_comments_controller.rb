class PictureCommentsController < ApplicationController
  before_filter :signed_in_user

  def new
  end

  def create
    @picpost = Picpost.find(params[:picture_comment][:picpost_id])
    comment = params[:picture_comment][:comment]
    current_user.comment!(@picpost, comment)
    respond_to do |format|
      format.html { redirect_to '/static_pages/home' }
      format.js #{ redirect_to comment_path(picpost_id: @picpost.id) }
    end
  end

  def destroy
   # @picpost = PictureComment.find(params[:id]).picpost
   # current_user.delete_comment!(@picpost)
   # respond_to do |format|
   #   format.html { redirect_to '/static_pages/home' }
   #   format.js
   # end
  end
  
end
