class FriendsController < ApplicationController
  def index
    @friends = graph.get_connections("me", "friends")
  end
end
