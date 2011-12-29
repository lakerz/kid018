class AddImgfileToBoard < ActiveRecord::Migration
  def self.up
    add_column :boards, :img_file, :string
  end

  def self.down
    remove_column :boards, :img_file
  end
end
