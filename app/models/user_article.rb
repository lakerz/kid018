#定义用户收藏文章的
class UserArticle < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
end
