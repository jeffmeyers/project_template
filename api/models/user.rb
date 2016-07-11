require 'models/session_token'

class User < ActiveRecord::Base
  has_many :session_tokens
end
