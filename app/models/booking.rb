# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :adults, presence: true, numericality: { only_integer: true }

  validates :end_date, comparison: { greater_than: :start_date, message: 'must be after start date' }
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  validate :overlapping_bookings
  validates :adults, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :child, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }

  def overlapping_bookings
    if Booking.where(room_id: room_id).where('? < end_date AND start_date < ?', start_date, end_date).any?
      errors.add(:base, 'This room is already booked for these dates')
    end
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_in_the_past
    errors.add(:end_date, "can't be in the past") if end_date.present? && end_date < Date.today
  end
end
