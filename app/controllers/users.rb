get '/users/:id' do
	@user = User.find_by(session[:user_id])
	@posts = Post.find_by(user_id: session[:user_id]) 
	erb :show
end