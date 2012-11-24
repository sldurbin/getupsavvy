class CommentRatingsController < ApplicationController
  #before_filter :signed_in_user
  before_filter :authenticate_user!

  def new
  end

  def create
    @picture_comment = PictureComment.find_by_id(params[:comment_rating][:picture_comment_id])
    rating = params[:comment_rating][:rating]
    current_user.rate_comment!(@picture_comment,rating)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @picture_comment = PictureComment.find_by_id(params[:comment_rating][:picture_comment_id])
    current_user.unrate_comment!(@picture_comment)
    respond_to do |format|
      format.html 
      format.js
    end

  end

end
