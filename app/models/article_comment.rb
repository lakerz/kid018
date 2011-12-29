class ArticleComment < ActiveRecord::Base
  belongs_to:article
  has_many:article_comment_replies
  self.per_page = 10
end
