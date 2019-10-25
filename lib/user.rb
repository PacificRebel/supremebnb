class User < ActiveRecord::Base
  has_many :spaces, foreign_key: :host_id
  has_many :bookings, foreign_key: :guest_id

end
