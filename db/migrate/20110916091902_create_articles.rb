class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :abstract
      t.integer :integer
      t.integer :read_num
      t.integer :useful_num
      t.integer :star_score
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
