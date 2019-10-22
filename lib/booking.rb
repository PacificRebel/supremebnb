class Booking < ActiveRecord::Base
  def approved!
    self.approved = true
  end
end