# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :autherised?
  def index
    @hotels = Hotel.all
  end

  def pending_bookings
    @bookings = Booking.where(is_approved: false)
  end

  def confirmed_bookings
    @bookings = Booking.where(is_approved: true)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to admins_path, notice: 'Booking was successfully updated.'
  end

  def approve_booking
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:is_approved, true)
      RespondMailer.booking_approved(@booking).deliver_now
      redirect_to admins_pending_bookings_path,
                  flash: { success: 'Booking Approved' }
    end
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    RespondMailer.booking_rejected(@booking).deliver_now
    if @booking.update_attribute(:is_approved, false)
      @booking.destroy
      redirect_to admins_pending_bookings_path,
                  flash: { success: 'Booking Rejected' }
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:is_approved)
  end

  def autherised?
    redirect_to log_in_path unless current_user.isAdmin?
  end
end
