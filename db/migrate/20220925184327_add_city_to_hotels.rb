# frozen_string_literal: true

class AddCityToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :city, :string
  end
end
