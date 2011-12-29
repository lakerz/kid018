class AddConfirmToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmed, :boolean
    add_column :users, :confirm_code, :string
  end

  def self.down
    remove_column :users, :confirm_code
    remove_column :users, :confirmed
  end
end
