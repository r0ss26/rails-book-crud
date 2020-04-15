class PagesController < ApplicationController
  def home
    @user = "admin"
  end

  def about
    @user = "admin"
  end
end