require_relative 'config/environment'
require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/booking'

class SupremeBNB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :index
  end
  
  get '/spaces' do
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
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    p params
    redirect '/'
  end

end
