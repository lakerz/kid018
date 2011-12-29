# coding: utf-8
class User < ActiveRecord::Base
  belongs_to :city
  has_many :user_articles


  has_attached_file :avatar,
    :styles => {
      :small => "45x45#",
      :medium => "100x100#",
      :temp => "45x45#",
      },
    :whiny => false,
    :url => "/uploadfiles/:class/:attachment/:id/:style.:extension",
    :path => ":rails_root/public/uploadfiles/:class/:attachment/:id/:style.:extension"

  validates_attachment_content_type :avatar,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
      :message => "只允许jpg/gif/png的图片上传"

  #确定用户是否有回复的权限
  def can_reply
    true
  end

  #验证用户是否存在或者是否为合法用户
  def User.authenticate(user_name, password)
    users = User.where("email = ? AND password = ?", user_name, password)
    if users.size > 0
      return users.first
    else
      return nil
    end
  end

  #用户的状态，是由status和confirmed两个属性共同决定的
  def life_status
    if !status
      "disable"
    else
      if confirmed
        "normal"
      else
        "unconfirmed"
      end
    end
  end

  #判断用户是否属于有效状态
  def is_effecitve
    life_status == "normal"
  end

end
