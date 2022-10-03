# frozen_string_literal: true

class AddIsAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :isAdmin, :boolean, default: false
  end
end
