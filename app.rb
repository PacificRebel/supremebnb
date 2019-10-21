require_relative 'config/environment'
require_relative 'lib/user'

class SupremeBNB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

end
