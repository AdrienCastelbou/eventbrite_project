class ParticipationsController < ApplicationController
  before_action :find_event
  def index 

  end

  def new
    
  end

  def create
    if already_go_in?
      flash[:alert] = "Vous y etes deja inscrit"
    else
      @event.participations.create(user: current_user)
      redirect_back(fallback_location: events_path)
      flash[:notice] = "Vous etes bien inscrit"
    end
  end

  def already_go_in?
    Participation.where(user_id: current_user.id, event_id: params[:event_id]).exists?
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
