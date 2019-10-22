class Booking < ActiveRecord::Base
  def approved!
    self.approved = true
  end

  def space
    Space.find_by(id: self.space_id)
  end

  def guest
    User.find_by(id: self.guest_id)
  end
end
