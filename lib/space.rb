class Space < ActiveRecord::Base

  def self.available(date)
    spaces = []
    Space.where("'#{date}' BETWEEN start_date AND end_date").each do |space|
      spaces << space unless self.booking_class.booked?(space.id, date)
    end
    return spaces
  end

  private

  def self.booking_class
    Booking
  end

end
