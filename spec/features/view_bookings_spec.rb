feature 'view bookings' do
  scenario 'host can see booking requests for their spaces' do
    user = User.create(username: 'zaira')
    space = Space.create(price: 20, name: "Loft", description: "nice", start_date: "2019-06-05", end_date: "2020-06-05")
    booking = Booking.create(space_id: space.id, guest_id: user.id, date: "2019-11-27")
    visit('users/#{user.id}/bookings')
    expect(page).to include booking
  end
end
