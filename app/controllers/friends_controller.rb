class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def show
  end
end
