class AuthsController < ApplicationController
  def create
    hmac_secret = "my$ecetK3y"
    payload = { name: params[:name], exp: Time.now.to_i + 30 }
    token = JWT.encode payload, hmac_secret, "HS256"
    render json: { msg: token }
  end
end
