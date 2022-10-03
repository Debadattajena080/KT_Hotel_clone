class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :Guests, :adults
  end
end
