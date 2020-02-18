class EventsController < ApplicationController
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
      redirect_to root_path
    else
      render new_event_path
    end
  end
end
