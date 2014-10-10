require 'sinatra'
set :views, Proc.new { File.join(root, "views") }