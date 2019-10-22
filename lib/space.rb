
class Space < ActiveRecord::Base

  def self.available(date)
    spaces = Space.where("'#{date}' BETWEEN start_date AND end_date")
    spaces.map do |space|
      space unless self.booking_class.booked?(space.id, date)
    end
  end
  
  private 

  def self.booking_class
    Booking
  end

end
