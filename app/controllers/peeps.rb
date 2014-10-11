get '/peeps/home' do
  @user = User.get(session[:user_id]) unless session[:user_id].nil?  
  erb :"peeps/home"
end