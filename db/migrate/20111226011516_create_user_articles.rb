class CreateUserArticles < ActiveRecord::Migration
  def self.up
    create_table :user_articles do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :status, :default => true
      t.datetime :cancel_date

      t.timestamps
    end
  end

  def self.down
    drop_table :user_articles
  end
end
