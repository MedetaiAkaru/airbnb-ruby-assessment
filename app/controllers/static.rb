get '/' do
	if !logged_in?
		erb :"static/index"
	else
		@property = Property.all
		erb :"properties/index"
	end
end