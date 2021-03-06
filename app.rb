require_relative 'config/environment'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/booking'

class SupremeBNB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end

  get '/spaces' do
    @user = User.find(session[:user_id]) if session[:user_id]
    @date = params[:date]
    session[:date] = @date
    @date ? (@spaces = Space.available(@date)) : (@spaces = Space.all)
    erb :'spaces/spaces'
  end

  get '/users/login' do
    erb :'users/login'
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
    
    redirect "/spaces"
  end

  post '/spaces/:id/bookings' do
    guest_id = session[:user_id]
    Booking.create(
      space_id: params[:id],
      guest_id: guest_id,
      date: session[:date]
    )
    redirect '/spaces'
  end

  get '/users/:id/bookings' do
    @user = User.find(params[:id])
    @bookings = []
    @user.spaces.each { |space| @bookings += space.bookings }
    erb :'users/bookings'
  end

  patch '/spaces/:space_id/bookings/:booking_id' do
    Booking.find(params[:booking_id]).approved!
    redirect "/users/#{session[:user_id]}/bookings"
  end
end
