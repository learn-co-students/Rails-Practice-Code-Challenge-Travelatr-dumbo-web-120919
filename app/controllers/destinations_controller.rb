class DestinationsController < ApplicationController
  before_action :find_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def show
    @most_recent = @destination.most_recent
    @average_age = @destination.average_age
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    
    redirect_to destination_path(@destination.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end

  def find_destination
    @destination = Destination.find(params[:id])
  end
end
