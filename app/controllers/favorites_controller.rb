class FavoritesController < ApplicationController
  #before_filter :signed_in_user
  before_filter :authenticate_user!

  def create
    @picpost = Picpost.find_by_id(params[:favorite][:picpost_id])
    current_user.favor_picpost!(@picpost)
    respond_to do |format|
      format.html
      format.js { render 'show' } 
    end
  end

  def destroy
    @picpost = Favorite.find(params[:id]).picpost
    current_user.unfavor_picpost!(@picpost)
    if params[:favorite][:reload] == "true"
      redirect_to user_favorite_path, id: current_user.id
    else 
      respond_to do |format|
        format.html
        format.js { render 'show' }
      end
    end
  end

end
