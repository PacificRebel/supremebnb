feature 'view bookings' do
  scenario 'host can see booking requests for their spaces' do
    guest = User.create(username: 'zaira')
    host = User.create(username: 'heli')
    space = Space.create(price: 20, name: "Loft", description: "nice", start_date: "2019-06-05", end_date: "2020-06-05", host_id: host.id)
    booking = Booking.create(space_id: space.id, guest_id: guest.id, date: "2019-11-27")
    visit("/users/#{host.id}/bookings")
    expect(current_path).to eq "/users/#{host.id}/bookings"
    expect(page).to have_content space.name
    expect(page).to have_content booking.date
    expect(page).to have_content guest.username
  end

  scenario 'host can approve booking' do
    guest = User.create(username: 'zaira')
    host = User.create(username: 'heli')
    space = Space.create(price: 20, name: "Loft", description: "nice", start_date: "2019-06-05", end_date: "2020-06-05", host_id: host.id)
    booking = Booking.create(space_id: space.id, guest_id: guest.id, date: "2019-11-27")
    visit("/users/#{host.id}/bookings")
    expect(page).to have_button 'Approve'
  end
end
