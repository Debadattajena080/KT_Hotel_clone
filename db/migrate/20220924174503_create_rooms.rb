# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :type
      t.integer :capacity
      t.integer :price
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
