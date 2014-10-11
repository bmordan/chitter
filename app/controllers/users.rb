get '/users/signup' do
  erb :"users/signup"
end

post '/users/signup' do
  @user = User.create(
    :email => params[:email],
    :name => params[:name],
    :handle => params[:handle],
    :password_digest => params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect to '/peeps/home'
  else
    flash.now[:errors] = @user.errors.full_messages
    redirect to '/users/signup'
  end
end

get '/users/login' do
  erb :"users/login"
end

post '/users/login' do
  @user = User.first(:handle => params[:handle])
  session[:user_id] = @user.id
  redirect to '/peeps/home'
end