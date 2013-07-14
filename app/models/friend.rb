class Friend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :facebook_id, :memo, :user_id, :name, :link

  def self.create_new_by_facebook_api(token)
    user = User.find_by_token(token)
    graph = Koala::Facebook::API.new(token)
    friends = graph.get_connections("me", "friends")
    friends.each do |friend|
      Friend.find_or_create_by_user_id_and_facebook_id(user_id: user.id, facebook_id: friend["id"], name: friend["name"], link: friend["link"])
    end
  end

end
