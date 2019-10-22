feature 'list spaces' do
  scenario 'user searches for spaces' do
    Space.create(name: 'MySpace', description: 'A cool space', price: 100, start_date: '2019-10-22', end_date: '2020-10-22')
    visit '/spaces'
    fill_in 'Date', with: '2019-12-25'
    click_button 'Submit'
    
    expect(page).to have_content('MySpace')
    expect(page).to have_content('A cool space')
    expect(page).to have_content('100')
  end
  
  scenario 'space is booked for selected date' do
    space = Space.create(name: 'MySpace', description: 'A cool space', price: 100, start_date: '2019-10-22', end_date: '2020-10-22')
    user = User.create(username: 'test_user')
    booking = Booking.create(space_id: space.id, guest_id: user.id, date: '2019-12-25')
    booking.approved!

    visit '/spaces'
    fill_in 'Date', with: '2019-12-25'
    click_button 'Submit'
    expect(page).to_not have_content('MySpace')
    expect(page).to_not have_content('A cool space')
    expect(page).to_not have_content('100')
  end
end