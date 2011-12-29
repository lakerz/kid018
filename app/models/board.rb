class Board < ActiveRecord::Base
  has_many:articles  #板块包括很多的文章

  has_attached_file :avatar,
    :styles => {
      :small => "50x50#",
      :medium => "80x80#",
      },
    :whiny => false,
    :url => "/uploadfiles/:class/:attachment/:id/:basename/:style.:extension",
    :path => ":rails_root/public/uploadfiles/:class/:attachment/:id/:basename/:style.:extension"

  validates_attachment_content_type :avatar, :content_type => 'image/jpeg'

end
