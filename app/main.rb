#Setup for the enviroment
env = ENV["RACK_ENV"] || "development"
#Setup for the app
require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'
require 'rack-protection'
require 'data_mapper'
#Set up database tables for sinatra
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/poop'
require_relative './seed'

include Seed #run in irb: _multiseed
# Setup for Sinatra
set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, "views") }
set :partial_template_engine, :erb
enable :sessions
set :session_secret, 'OYJEVFIKHZORXTUXXOYXXGPDEYLLPWXD'
use Rack::Flash
use Rack::MethodOverride
use Rack::Protection::EscapedParams
# Setup logic controllers (routes)
require_relative 'controllers/users'
require_relative 'controllers/peeps'
require_relative 'controllers/poops'
# Setup DataMapper
if ENV["RACK_ENV"] == "production"
  #DataMapper.setup(:default, "postgres://gafytmebscxehl:OnybE67aMWekzw8lY6bf-nT5B0@ec2-54-225-101-18.compute-1.amazonaws.com:5432/d59r3gl85st6bc")
  DataMapper.setup(:default, ENV["DATABASE_URL"])
else
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
end
DataMapper.finalize
DataMapper.auto_upgrade!
# Set the user to the first page
get '/' do
  redirect '/peeps/home'
end
#> heroku addons:add heroku-postgresql:dev
#> git push heroku branch:master
#> heroku git:remote -a falling-wind-1624 -r some_user_defined_name
#> heroku pg:reset DATABASE_URL --confirm gentle-eyrie-9191
#> heroku logs --app gentle-eyrie-9191
#> heroku run console --app gentle-eyrie-9191
#> irb(main):001:0> require './app/main.rb'
#=> true
#irb(main):002:0> DataMapper.auto_migrate!



