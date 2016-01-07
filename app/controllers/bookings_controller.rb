#DONE booking
get '/properties/:id/book' do
  @property = Property.find(params[:id])
  erb :"/properties/book"
end

#DONE booking (db)
post '/properties/:id/book' do
  booking = Booking.create(date_start: params[:datestart], date_end: params[:dateend], user_id: session[:user_id], property_id: params[:id])
  redirect "/properties/#{params[:id]}"
end