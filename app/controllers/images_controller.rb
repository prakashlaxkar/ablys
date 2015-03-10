class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @images = Image.all
    respond_with(@images)
  end

  def show
    respond_with(@image)
  end

  def new
    @event = find_imageable
    @image = find_imageable.images.new
    respond_with(@image)
  end

  def edit
  end

  def create
    @image = find_imageable.images.create(image_params)
    @image.save
    respond_with(find_imageable)
  end

  def update
    @image.update(image_params)
    respond_with(@image)
  end

  def destroy
    @image.destroy
    respond_with(@image)
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:title, :description, :image_holder_type, :image_holder_id, :avatar)
    end

    def find_imageable
      params.each do |name, value|
        if name =~/(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

end
