# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = current_user.events.where('event_date > ?', Time.zone.now).order(event_date: :desc)
  end

  def show; end

  def new
    @event =  Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy!
    redirect_to events_url, notice: 'Event was successfully destroyed.', status: :see_other
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :sport,
      :event_date,
      :title,
      :broadcast_platform,
      :url,
      :championship
    ).merge(user: current_user)
  end
end
