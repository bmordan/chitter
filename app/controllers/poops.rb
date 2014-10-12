get '/poops/add/:peep_id' do
  @peeps = [Peep.get(params[:peep_id])]
  @poops = Poop.all(:peep_id => params[:peep_id])
  erb :"poops/add"
end

post '/poops/add' do
  if params[:poop] == ""
    flash[:notice] = "You can't poop nout. Try again"
    redirect to '/'
  else
    poop = Poop.create(:poop => params[:poop],:peep_id => params[:peep_id])
    if poop.save
      peep = Peep.get(params[:peep_id])
      peeper = User.get(peep.user_id)
      user = User.get(session[:user_id])
      flash[:notice] = "#{user.handle} poops #{peeper.handle}"
      redirect to '/'
    else
      flash[:notice] = "Oh something went wrong that didn't save"
      redirect to '/'
    end
  end
end