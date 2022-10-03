# frozen_string_literal: true

class RespondMailer < ApplicationMailer
  def booking_approved(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'Booking Approved')
  end

  def booking_rejected(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: 'Booking Rejected')
  end
end
