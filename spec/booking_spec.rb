describe Booking do
  space = Space.new
  user = User.new
  date = "2019-12-25"
  subject(:booking) { described_class.new(space_id: space.id, guest_id: user.id, date: date) }
  
  it 'knows its space_id' do
    expect(subject.space_id).to eq space.id
  end
  it 'knows its guest_id' do
    expect(subject.guest_id).to eq space.id
  end
  it 'knows its booking date' do
    expect(subject.date).to eq Date.new(2019,12,25)
  end
  it 'knows its approval status' do
    expect(subject.approved?).to be_falsey
  end

  describe 'approve!' do
    it 'approves the booking' do
      expect(booking.approved?).to be_falsey
      booking.approved!
      expect(booking.approved?).to be true
    end
  end

  describe '.booked?' do
    it 'returns false if no approved bookings exist' do
      expect(Booking.booked?(space.id, date)).to eq false
    end
    it 'returns true if approved bookings exist' do
      booking.approved!
      expect(Booking.booked?(space.id, date)).to eq true
    end
  end
end