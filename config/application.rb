$LOAD_PATH.unshift(File.expand_path('../../api', __FILE__))

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/param'
require 'json'
require 'controllers/base_controller'
require 'controllers/users_controller'
require 'controllers/sessions_controller'

ActiveRecord::Base.logger.level = 1

class Application < Sinatra::Base
  set :root, File.expand_path('../../api', __FILE__)

  before do
    cache_control :public, max_age: 0
  end

  get '/' do
    erb :index
  end
end
