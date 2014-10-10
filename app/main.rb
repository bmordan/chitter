#Setup for the enviroment
env = ENV["RACK_ENV"] || "development"
#Setup for the app
require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'
require 'data_mapper'
#Set up database tables for sinatra
require_relative 'models/user'
# Setup for Sinatra
set :views, Proc.new { File.join(root, "views") }
set :public_folder, 'public'
set :partial_template_engine, :erb
enable :sessions
set :session_secret, 'OYJEVFIKHZORXTUXXOYXXGPDEYLLPWXD'
use Rack::Flash
use Rack::MethodOverride
# Setup logic controllers (routes)
require_relative 'controllers/users'
# Setup DataMapper
ENV["DATABASE_URL"].nil? ? DataMapper.setup(:default, "postgres://localhost/chitter_#{env}") : DataMapper.setup(:default, ENV["DATABASE_URL"])
DataMapper.finalize
DataMapper.auto_upgrade!