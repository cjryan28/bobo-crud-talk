get '/' do
	erb :index
end

get '/users/new' do
	@user = User.new
	erb :"users/new"
end

# get login
get '/sessions/new' do
	erb :"sessions/new"
end

# post signup
post '/users' do
	user = User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect '/hugs'
	else
		@errors = user.errors.full_messages
		erb :"/users/new"
	end
end

delete '/sessions' do
	session.clear
	redirect '/'
end

# post login
post '/sessions' do
	user = User.find_by(email: params[:user][:email])
	if user
		session[:user_id] = user.id
		redirect '/hugs'
	else
		redirect '/sessions/new'
	end
end

# homepage
get '/hugs' do
	current_user
	erb :"hugs/index"
end

# Edit user
get '/users/edit/:user_id' do
	@user = User.find(params[:user_id])
	erb :"users/edit"
end

# Update User
put '/users/:user_id' do
	@user = User.find(params[:user_id])
	@user.update(params[:user])
	redirect "/users/#{@user.id}"
end

# Profile Page
get '/users/:user_id' do
	current_user
	erb :"users/show"
end
