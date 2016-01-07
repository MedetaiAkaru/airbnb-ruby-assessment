#DONE Index page
get '/properties' do
  @property = Property.all
  erb :'properties/index'
end

#DONE create new property
get '/properties/new' do
  erb :"properties/new"
end

#DONE create new property (db)
post '/properties' do
  property = Property.create(user_id: session[:user_id], title: params[:title], price: params[:price], description: params[:description], image: params[:image])
  redirect "/properties/#{property.id}"
end

#DONE view property individually
get '/properties/:id' do
  @property = Property.find(params[:id])
  erb :"/properties/show"
end

#DONE edit property
get '/properties/:id/edit' do
  @property = Property.find(params[:id])
  if session[:user_id] == @property.user_id
    erb :"/properties/edit"
  else
    erb :"/nopermission"
  end
end

#DONE edit property (db)
post '/properties/:id/edit' do
  property = Property.find(params[:id])
  property.update(title: params[:title], price: params[:price], description: params[:description], image: params[:image])
  redirect "/properties/#{property.id}"
end

#NOT DONE delete property
post '/properties/:id/delete' do
  Property.delete(params[:id])
  erb :'room/index'
end