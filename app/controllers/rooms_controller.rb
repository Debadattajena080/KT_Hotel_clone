# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :must_be_admin, only: %i[new create edit update destroy]

  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = @hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.new
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    @room = Room.find(params[:id])
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.new(room_params)
    if @room.save
      flash[:success] = 'Room created successfully'
      redirect_to hotel_path(@hotel)
    else

      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    if @room.update(room_params)
      flash[:success] = 'Room updated successfully'
      redirect_to hotel_path(@hotel)
    else
      render 'edit'
    end
  end

  def luxury
    @luxuries = Room.where(room_type: 'Luxury Suite')
  end

  def deluxe
    @deluxes = Room.where(room_type: 'Deluxe Room')
  end

  def president
    @presidents = Room.where(room_type: 'President Suite')
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    if @room.destroy!
      flash[:danger] = 'Room deleted successfully'
      redirect_to hotel_path(@hotel)
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_type, :price, :image)
  end
end
