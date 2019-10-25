guest = User.create(username: 'guest')
host = User.create(username: 'host')
loft = Space.create(price: 20, name: 'Loft', description: 'ugly', start_date: '2019-10-26', end_date: '2020-10-26', host_id: host.id)
Booking.create(space_id: loft.id, guest_id: guest.id, date: '2019-12-25').approved!
Booking.create(space_id: loft.id, guest_id: guest.id, date: '2019-12-26')
