# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :hotel
  has_one_attached :image, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :room_type, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :hotel_id, presence: true

  scope :Luxury, -> { where(room_type: 'Luxury Suite') }
  scope :Deluxe, -> { where(room_type: 'Deluxe Room') }
  scope :Presidential, -> { where(room_type: 'President Suite') }
end
