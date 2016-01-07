#DONE make a booking
get '/properties/:id/book' do
  @property = Property.find(params[:id])
  erb :"/properties/book"
end

#DONE make a booking (db)
post '/properties/:id/book' do
  booking = Booking.create(date_start: params[:datestart], date_end: params[:dateend], extra: params[:extra], user_id: session[:user_id], property_id: params[:id])
  redirect "/bookings/#{booking.id}"
end

#DONE Show booking
get '/bookings/:id' do
	  @booking = Booking.find(params[:id])
  if session[:user_id] == @booking.user_id
	  erb :"/bookings/show"
  else
    erb :"/nopermission"
  end
end


#DONE update booking
get '/bookings/:id/edit' do
  @booking = Booking.find(params[:id])
  if session[:user_id] == @booking.user_id
    erb :"/bookings/edit"
  else
    erb :"/nopermission"
  end
end

#DONE edit booking (db)
post '/bookings/:id/edit' do
	booking = Booking.find(params[:id])
  booking.update(date_start: params[:datestart], date_end: params[:dateend], extra: params[:extra])
  redirect "/bookings/#{booking.id}"
end

#DONE delete booking
post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect "/"
end