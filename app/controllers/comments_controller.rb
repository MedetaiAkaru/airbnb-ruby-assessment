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

#DONE Show comment
get '/comments/:id' do
  @comment = Comment.find(params[:id])
  erb :"/comments/show"
end

#DONE update comment
get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  if session[:user_id] == @comment.user_id
    erb :"/comments/edit"
  else
    erb :"/nopermission"
  end
end

#DONE edit comment (db)
post '/comments/:id/edit' do
	comment = Comment.find(params[:id])
  comment.update(commenttext: params[:commenttext])
  redirect "/comments/#{comment.id}"
end

#DONE delete comment
post '/comments/:id/delete' do
  Comment.delete(params[:id])
  redirect "/"
end