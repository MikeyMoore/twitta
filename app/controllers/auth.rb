
post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:encrypted_password])
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
  erb :login
end

get '/' do
  redirect to '/login'
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