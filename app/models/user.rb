class User < ActiveRecord::Base
  attr_accessible :uid, :token

  has_many :friends
end
