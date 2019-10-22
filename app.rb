require_relative 'config/environment'
require_relative 'lib/space'

class SupremeBNB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

end
