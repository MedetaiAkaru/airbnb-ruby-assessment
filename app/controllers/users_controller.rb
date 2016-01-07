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

#NOT DONE user profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

#NOT DONE user properties page
get '/users/:id/properties' do
  @user = User.find(params[:id])
  erb :"/users/properties"
end

#NOT DONE user bookings
get '/users/:id/bookings' do
  @user = User.find(params[:id])
  erb :"/users/booking"
end

#NOT DONE edit user profile
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/editprofile"
end

#NOT DONE edit user profile (db)
post '/users/:id/edit' do
	user = User.find(params[:id])
  user.update(name: params[:name], email: params[:email])
  redirect "/users/#{user.id}"
end