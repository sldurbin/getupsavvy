class StaticPagesController < ApplicationController
  def home
    @picposts = Picpost.all
  end

  def help
  end

  def about
  end

  def contact
  end

  def splash
  end
end
