class Booking < ActiveRecord::Base
  def approved!
    self.approved = true
  end

  def self.booked?(space_id, date)
    return true unless Booking.where(space_id: space_id, approved: true, date: date)

    false
  end
end