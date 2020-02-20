class ParticipationsController < ApplicationController
  before_action :find_event
  def index 

  end

  def new
    
  end

  def create
    if already_go_in?
      flash[:alert] = "Vous y etes deja inscrit"
      redirect_to event_path(@event.id)
    else
    
      @amount = @event.price * 100

      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
      })

      
      @event.participations.create(user: current_user)
      flash[:notice] = "Vous etes bien inscrit"
      redirect_to event_path(@event.id)
    
      begin
        rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_back(fallback_location: events_path)
      end
    end
  end

  def already_go_in?
    Participation.where(user_id: current_user.id, event_id: params[:event_id]).exists?
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
