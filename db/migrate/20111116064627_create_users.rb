class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :city_name
      t.integer :score
      t.string :avatar
      t.string :level
      t.boolean :status

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
