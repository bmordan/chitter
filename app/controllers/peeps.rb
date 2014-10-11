get '/peeps/home' do
  @user = User.get(session[:user_id]) unless session[:user_id].nil?
  @peeps = Peep.all(:order => [:created_at.desc])
  erb :"peeps/home"
end