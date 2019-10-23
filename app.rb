require_relative 'config/environment'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/booking'

class SupremeBNB < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end
  
  get '/spaces' do
    date = params[:date]
    session[:date] = date
    @spaces = Space.available(date) if date
    erb :'spaces/spaces'
  end

  post '/users' do
    User.create(username: params[:username] )
    redirect '/'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    redirect '/'
  end

  post '/spaces/:id/bookings' do
    guest_id = params[:user_id] || User.all.first.id
    Booking.create(
      space_id: params[:id],
      guest_id: guest_id,
      date: session[:date]
    )
    redirect '/'
  end

end
