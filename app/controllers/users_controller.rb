class UsersController < ApplicationController
  require 'net/http'
  #before_filter :signed_in_user, only: [:index, :edit, :update]
  #before_filter :correct_user, only: [:edit, :update]
  #before_filter :admin_user, only: :destroy
  before_filter :authenticate_user!, only: [:index, :edit, :update]

  def index
    #@users = User.paginate(page: params[:page])
    @top_posters = User.order("picposts_count desc").limit(5).all
    @top_commenters = User.order("picture_comments_count desc").limit(5).all
    @most_dashing = User.order("good_picture_ratings_count desc").limit(5).all
    @most_thanked = User.order("good_comment_ratings_count desc").limit(5).all
    @most_favorited = User.order("favorited_count desc").limit(5).all
  end

  def show
    @user = User.find(params[:id])
    @frame = params[:frame]
    if @frame == 'picposts'
      @picposts = @user.picposts
    elsif @frame == 'comments'
      @picposts = @user.picture_comments.map{ |p| p.picpost }.uniq   
    elsif @frame == 'feedback'
      @picposts = @user.picture_ratings.map{ |p| p.picpost }
    elsif @frame == 'favorites'
      @picposts = @user.favorites.map{ |f| f.picpost } 
    else
      @picposts = []
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha(@user) && @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def show_picposts
    @user = User.find(params[:id])
    @picposts = @user.picposts
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show_comments
    @user = User.find(params[:id])
    @picposts = @user.picture_comments.map{ |p| p.picpost }.uniq
    respond_to do |format|
      format.html
      format.js
    end
  end
 
  def show_feedback
    @user = User.find(params[:id])
    @picposts = @user.picture_ratings.map{ |p| p.picpost }
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show_favorites
    @user = User.find(params[:id])
    @picposts = @user.favorites.map{ |f| f.picpost }
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
