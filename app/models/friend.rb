class Friend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :facebook_id, :memo
end
