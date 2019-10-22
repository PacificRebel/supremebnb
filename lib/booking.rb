class Booking < ActiveRecord::Base
  def approved!
    self.approved = true
    self.save
  end

  def self.booked?(space_id, date)
    return true unless Booking.where(space_id: space_id, approved: true, date: date).length.zero?

    false
  end
end