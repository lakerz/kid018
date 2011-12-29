#coding: utf-8

class Article < ActiveRecord::Base
  belongs_to:board
  has_many:article_comments
  has_many :user_articles, :dependent => :destroy  #如果删除文章，则所有的收藏也被删除

  has_attached_file :avatar,
    :styles => {
      :small => "72x54#",
      :medium => "128x96#",
      :large => "256x192#"
      },
    :whiny => false,
    :url => "/uploadfiles/:class/:attachment/:id/:basename/:style.:extension",
    :path => ":rails_root/public/uploadfiles/:class/:attachment/:id/:basename/:style.:extension"

  validates_attachment_content_type :avatar,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
      :message => "只允许图像文件"

  #文章被阅读一次
  def Article.read(article_id)
    article = Article.find(article_id)
    read_num = article.read_num ? article.read_num+1 : 1
    article.update_attribute(:read_num, read_num )
    return article
  end

  #文章被顶一次
  def Article.ding(article_id)
    article = Article.find(article_id)
    useful_num = article.useful_num ? article.useful_num+1 : 1
    article.update_attribute(:useful_num, useful_num )
    return article
  end

end
