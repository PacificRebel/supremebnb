class Booking < ActiveRecord::Base
  def approved!
    self.approved = true
    self.save
  end

  def self.booked?(space_id, date)
    return false if Booking.where("space_id = #{space_id} AND approved = TRUE AND date = '#{date}'").length.zero?
    true
  end

  def space
    Space.find_by(id: self.space_id)
  end

  def guest
    User.find_by(id: self.guest_id)
  end
end
