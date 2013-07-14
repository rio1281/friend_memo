class AddLinkToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :link, :string
  end
end
