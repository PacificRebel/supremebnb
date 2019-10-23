feature 'request booking' do
  scenario 'user click book button on a space' do
    space = Space.create(name: 'MySpace', description: 'A cool space', price: 100, start_date: '2019-10-22', end_date: '2020-10-22')
    User.create(username: 'Testy')

    visit '/spaces'
    fill_in 'Date', with: '2019-12-25'
    click_button 'Submit'
    click_button 'Book'

    booking = Booking.all.first
    expect(booking.space_id).to eq space.id
  end
end