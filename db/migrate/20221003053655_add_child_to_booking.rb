class AddChildToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :child, :integer
  end
end
