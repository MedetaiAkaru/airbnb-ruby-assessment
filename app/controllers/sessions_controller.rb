post '/login' do
 if (user = User.authenticate(params[:user][:email], params[:user][:password]))
    session[:user_id] ||= user.id
    session[:email] ||= user.email
  redirect '/'
  else
  redirect '/'
  end
end

post '/logout' do
  session[:user_id] = nil
  session[:email] = nil
  redirect '/'
end