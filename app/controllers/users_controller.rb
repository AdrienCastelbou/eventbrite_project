class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_the_current_user_profil?, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_events = []
    Event.all.each do |event|
      @user_events << event if event.admin.id == @user.id
    end
  end

  def is_the_current_user_profil?
    redirect_to root_path if current_user != User.find(params[:id])
  end
  
end
