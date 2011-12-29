class Province < ActiveRecord::Base
  has_many :city
end
