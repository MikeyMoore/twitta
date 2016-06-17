get '/users/:id' do
	@user = User.find_by(session[:user_id])
	@posts = Post.find_by(user_id: session[:user_id]) 
	erb :show
end
 
get '/users/edit' do
	@user = User.find_by(session[:user_id])
	erb :edit
end

post '/users/edit' do
	@user = User.find_by(session[:user_id])
	@user.update(params[:user])
	redirect '/users/:id'
end