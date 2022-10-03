# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { minimum: 3, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: 'only allows letters and numbers' }
  before_save { self.username = username.titleize }

  validates :contact, presence: true, numericality: { only_integer: true, message: 'number is invalid' },
                      length: { is: 10 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  before_save { self.email = email.downcase }
  validates :password, presence: true, length: { minimum: 6 }

  has_many :bookings, dependent: :destroy
  has_many :rooms, through: :bookings
end
