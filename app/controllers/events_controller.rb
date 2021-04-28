class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]
  before_action :set_event, only: %w[show edit update destroy]

  def index
    @events = Event.order(created_at: :asc)
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :description, :photo, :subtitle, :title)
  end
end
