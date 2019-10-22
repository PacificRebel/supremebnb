require_relative 'config/environment'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/booking'

class SupremeBNB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end

  post '/users' do
    User.create(username: params[:username] )
    redirect '/'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    redirect '/'
  end

  get '/users/:id/bookings' do
    @spaces = Space.where(host_id: params[:id])
    @bookings = []
    @spaces.each { |space| @bookings += Booking.where(space_id: space.id) }
    erb :'users/bookings'
  end

end
