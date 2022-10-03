# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @user = User.find(session[:user_id])
    @bookings = @user.bookings.order(start_date: :asc)
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.create(booking_params)
    @booking.user_id = Current.user.id
    if @booking.save
      redirect_to hotel_room_path(@hotel, @room),
                  flash: { success: 'Booking is created Successfully and waiting for approval' }
    else
      flash[:danger] = 'Booking was not created.'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :adults, :child, :is_approved)
  end
end
