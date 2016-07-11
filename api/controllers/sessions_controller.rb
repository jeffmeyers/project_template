require 'models/user'
require 'bcrypt'

class SessionsController < BaseController
  post '/sessions' do
    param :email, String, required: true
    param :password, String, required: true

    user = User.where(email: params[:email]).first
    halt 401 if unauthorized?(user)

    active_token = user.session_tokens.where(active: true).first
    active_token ||=
      SessionToken.create!(user_id: user.id)

    status 200
    {
      sessions: {
        token: active_token,
        user: user
      }
    }.to_json
  end

  private
  def unauthorized?(user)
    return true if user.nil?
    BCrypt::Password.new(user.encrypted_password) != params[:password]
  end
end
