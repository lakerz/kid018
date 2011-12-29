class CreateInvitecodes < ActiveRecord::Migration
  def self.up
    create_table :invitecodes do |t|
      t.string :code
      t.integer :create_user_id
      t.boolean :status
      t.datetime :enable_date
      t.integer :enable_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invitecodes
  end
end
