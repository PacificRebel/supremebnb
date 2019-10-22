require_relative 'config/environment'
require_relative 'lib/user'
require_relative 'lib/space'

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

  post '/spaces/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
  end

end
