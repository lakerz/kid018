class CreateArticleCommentReplies < ActiveRecord::Migration
  def self.up
    create_table :article_comment_replies do |t|
      t.integer :article_comment_id
      t.text :content
      t.integer :user_id
      t.boolean :hide

      t.timestamps
    end
  end

  def self.down
    drop_table :article_comment_replies
  end
end
