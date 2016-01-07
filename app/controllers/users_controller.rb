post '/users/new' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] ||= user.id
    redirect "/"
  else
    redirect "/"
  end
end  

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"/users/profile"
end


get '/users/:id/properties' do
  @user = User.find(params[:id])
  erb :"/users/properties"
end


get '/users/:id/bookings' do
  @user = User.find(params[:id])
  erb :"/users/booking"
end


get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/editprofile"
end


post '/users/:id/edit' do
	user = User.find(params[:id])
  user.update(name: params[:name], email: params[:email])
  redirect "/users/#{user.id}"
end