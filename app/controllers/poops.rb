get '/poops/add/:peep_id' do
  @peeps = [Peep.get(params[:peep_id])]
  erb :"poops/add"
end

post '/poops/add' do
  flash[:notice] = "You can't poop nout. Try again"
  redirect to '/peeps/home'
end