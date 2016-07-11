require_relative '../spec_helper'

describe SessionsController do
  include Rack::Test::Methods
  let(:app) { SessionsController }
  let(:params) do
    {
      email: 'jeffreym.meyers@gmail.com',
      password: 'password'
    }
  end

  describe 'POST /sessions' do
    context 'user exists' do
      before do
        @user = User.create! \
          email: 'jeffreym.meyers@gmail.com',
          first_name: 'Jeff',
          last_name: 'Meyers',
          encrypted_password: BCrypt::Password.create('password')
      end

      it 'returns active token if one exists' do
        token = SessionToken.create!(user_id: @user.id)
        SessionToken.stub(:create!) { {} }
        response = post '/sessions', params
        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['sessions']['token']['token']).to eq(token.token)
        expect(SessionToken).not_to have_received(:create!)
      end

      it 'returns 200 and user object if password is correct' do
        SessionToken.stub(:create!) { {} }
        response = post '/sessions', params
        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        expect(body['sessions']).to be_a(Hash)
        expect(body['sessions']['token']).to be_a(Hash)
        expect(body['sessions']['user']).to be_a(Hash)
        expect(SessionToken).to have_received(:create!).with(user_id: @user.id)
      end

      it 'returns 401 if password does not match' do
        response = post '/sessions', params.merge({
          password: 'wrong'
        })
        expect(response.status).to eq(401)
      end
    end

    context 'user does not exist' do
      it 'returns 401' do
        invalid_params = {
          email: 'foo@bar.com',
          password: 'password'
        }
        response = post '/sessions', invalid_params
        expect(response.status).to eq(401)
      end
    end
  end
end
