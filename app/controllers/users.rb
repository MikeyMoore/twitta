get '/users/stream' do
	@posts = []
	@posts = Post.order(:updated_at)
	erb :stream
end

get '/users/:id' do
	@user = User.find(params[:id])
	@posts = Post.where(user_id: @user.id) 
	erb :show
end

post '/users/results' do
	@queries = []
	first = User.where(["first_name LIKE ?", "%#{params[:search]}%"])
	last = User.where(["last_name LIKE ?", "%#{params[:search]}%"])
	username = User.where(["username LIKE ?", "%#{params[:search]}%"])
	if !first.empty?
		@queries << first
	end
	if !last.empty?
		@queries << last
	end
	if !username.empty?
		@queries << username
	end
	erb :results
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

get '/users/friend/:id' do
	@user = User.find(params[:id])
	@posts = Post.where(user_id: @user.id) 
	erb :show_other
end




