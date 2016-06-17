get '/users/:id' do
	@user = User.find(params[:id])
	@posts = Post.where(user_id: @user.id) 
	erb :show
end

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :edit
end

post '/users/edit' do
	id = params[:id]
	@user = User.find(params[:id])
	@user.update(params[:user])
	redirect '/'
end

post '/users/post' do
	@post = Post.create(content: params[:Twit], user_id: params[:id])
	redirect '/'
end


