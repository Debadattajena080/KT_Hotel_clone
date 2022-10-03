# frozen_string_literal: true

class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, length: { minimum: 3 },
                   format: { with: /\A[a-zA-Z0-9 ]+\z/, message: 'only allows letters, numbers and spaces' }
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :about, presence: true, length: { maximum: 500 }
  validates :city, presence: true, length: { maximum: 20 },
                   format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
end
