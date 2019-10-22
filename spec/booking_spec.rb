describe Booking do
  space = Space.new
  user = User.new
  date = Date.new
  subject(:booking) { described_class.new(space_id: space.id, guest_id: user.id, date: date) }
  it 'knows its space_id' do
    expect(subject.space_id).to eq space.id
  end
  it 'knows its guest_id' do
    expect(subject.guest_id).to eq space.id
  end
  it 'knows its booking date' do
    expect(subject.date).to eq date
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
end