get '/users/signup' do
  erb :"users/signup"
end

post '/users/signup' do
  @name = params[:name]
  erb :"peeps/home"
end

get '/users/login' do
  erb :"users/login"
end