class AddIsApprovedToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :is_approved, :boolean, default: false
  end
end
