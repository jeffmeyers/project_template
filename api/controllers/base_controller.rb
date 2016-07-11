class BaseController < Sinatra::Base
  set :show_exceptions, false
  set :raise_errors, true

  helpers Sinatra::Param

  before do
    content_type :json
    content_type 'application/json'
  end

  def authorize!
    halt 401
  end
end
