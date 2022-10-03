class RemoveCapacityFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :capacity, :integer
  end
end
