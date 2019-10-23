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
    @user = User.find(session[:user_id]) if session[:user_id]
    date = params[:date]
    session[:date] = date
    @spaces = Space.available(date) if date
    erb :'spaces/spaces'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(username: params[:username] )
    redirect '/sessions/new', 307 
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/sessions/new' do
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  post '/spaces' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      start_date: params[:start_date],
      end_date: params[:end_date],
      host_id: session[:user_id]
    )
    redirect '/'
  end

  post '/spaces/:id/bookings' do
    guest_id = session[:user_id]
    Booking.create(
      space_id: params[:id],
      guest_id: guest_id,
      date: session[:date]
    )
    redirect '/'
  end

end
