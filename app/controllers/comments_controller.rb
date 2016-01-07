#DONE posting a comment
get '/properties/:id/comment' do
  @property = Property.find(params[:id])
  erb :"/properties/comment"
end

#DONE posting a comment (db)
post '/properties/:id/comment' do
  comment = Comment.create(commenttext: params[:commenttext], user_id: session[:user_id], property_id: params[:id])
  redirect "/properties/#{params[:id]}"
end

