get '/' do
	erb :login
end 

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    erb :show
  else
    redirect '/'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

get '/login' do
  erb :index
end

get '/users/new' do 
  erb :new
  end

post '/users/new' do
@a = User.new(params[:user])
if @a.save == true
  redirect '/login'
else
  redirect '/users/new'
end
end