# frozen_string_literal: true

class HotelsController < ApplicationController
  before_action :must_be_admin, only: %i[new create edit update destroy]

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms
    @total_rooms = @rooms.count
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:success] = 'Hotel updated successfully'
      redirect_to root_path
    else
      flash.now[:error] = 'Hotel was not updated'
      render 'edit'
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_path,
                flash: { success: 'Hotel was successfully deleted' }
  end

  def search
    @hotels = Hotel.where('city LIKE ?', "%#{params[:q]}%")
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :about, :city, :latitude, :longitude, :image)
  end
end
