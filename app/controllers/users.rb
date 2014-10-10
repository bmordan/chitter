get '/signup' do
  erb :"users/signup"
end

post '/signup' do
  @name = params[:name]
  erb :"peeps/home"
end