class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    event_params = params.permit(:title, :description, :price, :location, :duration, :start_date)
    @event = Event.new( event_params)
    @event.admin = current_user
    if @event.save
      flash[:notice] = "Post successfully created"
      redirect_to event_path(@event.id)
    else
      render new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.permit(:title, :description, :price, :location, :duration, :start_date)
  
  if @event.update(event_params)
    redirect_to event_path(params[:id]),  :notice => "Le potin a bien été modifié."
  else
    redirect_back(fallback_location: event_path)
  end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end
end
