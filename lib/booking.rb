class Booking < ActiveRecord::Base
  belongs_to :space
  belongs_to :guest, class_name: :User
  has_one :host, through: :space

  def approved!
    self.approved = true
    self.save
  end

  def self.booked?(space_id, date)
    return false if Booking.where("space_id = #{space_id} AND approved = TRUE AND date = '#{date}'").length.zero?
    true
  end
end
