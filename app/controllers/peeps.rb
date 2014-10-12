get '/peeps/home' do
  @user = User.get(session[:user_id]) unless session[:user_id].nil?
  @peeps = Peep.all(:order => [:created_at.desc])
  erb :"peeps/home"
end

get '/peeps/add' do
  user = User.get(session[:user_id])
  @user_id = user.id
  erb :"peeps/add"
end

post '/peeps/add' do
  redirect to '/peeps/add', notice: "Your peep cant be empty of peepy pepper" if params[:peep].nil?
  Peep.create(:peep => params[:peep],:user_id => params[:user_id])
  redirect to '/peeps/home'
end