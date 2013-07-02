class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
    respond_to do |format|
      format.html { render }
      format.json { render json: @friends.as_json }
    end
  end

  def show
    @friend = current_user.friends.find(params[:id])
  end

  def edit
    @friend = current_user.friends.find(params[:id])
  end

  def update
    @friend = current_user.friends.find(params[:id])
    if @friend.update_attributes(params[:friend])
      redirect_to friend_path, notice: '更新されました！'
    else
      render action: 'edit'
    end
  end

end
