require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'
set :views, Proc.new { File.join(root, "views") }
set :public_folder, 'public'
set :partial_template_engine, :erb
enable :sessions
use Rack::Flash
use Rack::MethodOverride
require_relative 'controllers/users'

get '/' do
  welcome to chitter
end