class PicpostsController < ApplicationController
  #before_filter :signed_in_user
  before_filter :authenticate_user!

  def new
    @picpost = Picpost.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @picpost = current_user.picposts.build(params[:picpost])
    if @picpost.save
      redirect_to @picpost
    else
      flash[:error] = @picpost.errors.full_messages.to_sentence
      redirect_back_or root_path
      # TODO: Redirect to previous path
    end
  end

  def show
    @picpost = Picpost.find(params[:id])
  end

  def destroy
  end

  def view_comments
    @picpost = Picpost.find(params[:picpost_id])
    @comments = @picpost.picture_comments
    respond_to do |format|
      format.html 
      format.js 
    end
  end

end
