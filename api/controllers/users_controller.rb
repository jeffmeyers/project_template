require 'models/user'
require 'bcrypt'

class UsersController < BaseController
  post '/users' do
    param :email, String, required: true
    param :first_name, String, required: true
    param :last_name, String, required: true
    param :password, String, required: true
    param :password_confirmation, String, required: true

    halt 400, 'Passwords must match.' unless passwords_match?

    encrypted_password = BCrypt::Password.create(params[:password])

    user = User.create! \
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      encrypted_password: encrypted_password

    status 201
    { user: user }.to_json
  end

  private

  def passwords_match?
    params[:password] == params[:password_confirmation]
  end
end
