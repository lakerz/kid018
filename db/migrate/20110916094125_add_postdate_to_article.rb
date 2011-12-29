class AddPostdateToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :post_time, :datetime
  end

  def self.down
    remove_column :articles, :post_time
  end
end
