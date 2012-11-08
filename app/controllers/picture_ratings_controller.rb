class PictureRatingsController < ApplicationController
  before_filter :signed_in_user

  def new
  end

  def create
    @picpost = Picpost.find(params[:picture_rating][:picpost_id])
    rating = params[:picture_rating][:rating]
    current_user.rate!(@picpost, rating)
    respond_to do |format|
      format.html { redirect_to '/static_pages/home' }
      format.js
    end
  end

  def show
  end

  
end
