get '/' do
	erb :index
end

get '/users/new' do
	# @user = User.new
	erb :"users/new"
end

# get login

# post signup
post '/users' do
	# create a new user
	# redirect to homepage
	user = User.create(params[:user])
	session[:user_id] = user.id
	redirect '/hugs'
end

# post login

# homepage
get '/hugs' do
	erb :"hugs/index"
end