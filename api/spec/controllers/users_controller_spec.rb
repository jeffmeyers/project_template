require_relative '../spec_helper'

describe UsersController do
  include Rack::Test::Methods
  let(:app) { UsersController }
  let(:params) do
    {
      email: 'jeffreym.meyers@gmail.com',
      first_name: 'Jeff',
      last_name: 'Meyers',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  describe 'POST /users' do
    it 'returns 400 if necessary params are missing' do
      params.keys.each do |key_to_exclude|
        new_params = params.reject { |k, v| k == key_to_exclude }
        response = post '/users', new_params
        expect(response.status).to eq(400)
      end
    end

    it 'returns 400 if passwords do not match' do
      new_params = params.clone
      new_params[:password_confirmation] = 'test'
      response = post '/users', new_params
      expect(response.status).to eq(400)
      expect(response.body).to match(/must match/)
    end

    it 'returns 201 and a user with valid params' do
      response = post '/users', params
      expect(response.status).to eq(201)
      body = JSON.parse(response.body)
      expect(body['user']).to be_a(Hash)
    end
  end
end
