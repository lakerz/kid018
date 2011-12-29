class AddDescToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :self_desc, :text
    add_column :users, :signature, :string
  end

  def self.down
    remove_column :users, :signature
    remove_column :users, :self_desc
  end
end
