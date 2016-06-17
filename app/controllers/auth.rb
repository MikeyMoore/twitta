get '/' do
	erb :login
end 

post '/login' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    erb :home
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
