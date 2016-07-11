require 'rack'
require 'rack/contrib'

require('./config/application.rb')

use Rack::PostBodyContentTypeParser

use UsersController
use SessionsController
