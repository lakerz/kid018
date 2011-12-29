class CreateArticleComments < ActiveRecord::Migration
  def self.up
    create_table :article_comments do |t|
      t.integer :article_id
      t.text :content
      t.integer :linked_comment_id
      t.boolean :lighted, :default => false
      t.boolean :hide, :default => false
      t.text :log
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :article_comments
  end
end
