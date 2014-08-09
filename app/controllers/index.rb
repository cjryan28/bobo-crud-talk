get '/' do
	erb :index
end

get '/users/new' do
	# @user = User.new
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
	erb :"hugs/index"
end