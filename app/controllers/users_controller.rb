#DONE create new user (db)
post '/users/new' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] ||= user.id
    redirect "/"
  else
    redirect "/"
  end
end  

#DONE user profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

#DONE user properties page
get '/users/:id/properties' do
  @user = User.find(params[:id])
  erb :"/users/properties"
end

#DONE user bookings
get '/users/:id/bookings' do
  @user = User.find(params[:id])
  erb :"/users/bookings"
end

#DONE user comments
get '/users/:id/comments' do
  @user = User.find(params[:id])
  erb :"/users/comments"
end

#DONE edit user profile
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/edit"
end

#DONE edit user profile (db)
post '/users/:id/edit' do
	user = User.find(params[:id])
  user.update(name: params[:name], email: params[:email])
  redirect "/users/#{user.id}"
end