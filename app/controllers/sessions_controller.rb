class SessionsController < ApplicationController

  def callback

    #omniauth.auth環境変数を取得
    auth = request.env["omniauth.auth"]

    #Userモデルを検索
    user = User.find_by_uid(auth["uid"])

    if user
       # 既にユーザ情報があった場合　ログインしてルートに遷移
       Friend.create_new_by_facebook_api(user.token)
       session[:user_id] = user.id
       redirect_to root_url
    else
       # Userモデルに:uidが無い場合、データを新規作成してログインしてルートに遷移
       user = User.create(uid: auth["uid"], token: auth["credentials"]["token"])
       Friend.create_new_by_facebook_api(user.token)
       session[:user_id] = user.id
       redirect_to root_url
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Log out"
  end

end
