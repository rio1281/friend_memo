class SessionsController < ApplicationController

  def callback

    #omniauth.auth環境変数を取得
    auth = request.env["omniauth.auth"]

    #Userモデルを検索
    user = User.find_by_uid(auth["uid"])

    if user
       # 既にユーザ情報があった場合　ログインしてルートに遷移
       session[:user_id] = user.id
       redirect_to root_url, :notice => "ログインしました。"
    else
       # Userモデルに:uidが無い場合、データを新規作成してログインしてルートに遷移
       user = User.create(uid: auth["uid"])
       session[:user_id] = user.id
       redirect_to root_url, :notice => "Facebookアカウントと接続しました。"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Log out"
  end

end
