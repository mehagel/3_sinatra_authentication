
get '/' do
  # render home page
 #TODO: Show all users if user is signed in

  if current_user
    @user=User.find(session[:user_id])
    @users=User.all
    erb :index
  end
  erb :index
  
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  if User.authenticate(params[:email], params[:password])
    @user = User.find_by_email(params[:email])
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session[:user_id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  @user = User.create(params)
  # sign-up a new user
  erb :sign_in
end
