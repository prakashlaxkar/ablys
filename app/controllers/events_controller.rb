class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.where(is_verify: true).order("updated_at desc")
    # @image = Image.new
    respond_with(@events)
  end

  def galary
    @events = Event.order("updated_at desc")
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    @event.images.build
    respond_with(@event)
  end

  def edit
    @events = Event.all
    @event.images.build if @event.images.blank?
    respond_with(@events)
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
    flash[:notice] = "Event created successfully. It will be displayed in news after verifing by admin."
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :start_date, :user_id, images_attributes: [:id, :avatar, :image_holder_id, :image_holder_type, :title, :description, :_destroy])
    end
end
