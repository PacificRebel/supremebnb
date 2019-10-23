feature 'user login' do
  scenario 'user signs up' do
    visit '/'
    click_link 'Sign Up'
    expect(current_path).to eq '/users/new'
    fill_in 'username', with: 'cool_kevin'
    click_button 'Submit'
    
    user = User.all.first
    expect(user.username).to eq 'cool_kevin'
  end

  scenario 'existing user logs in' do
    User.create(username: 'cooler_brad')
    visit '/'
    fill_in 'username', with: 'cooler_brad'
    click_button 'Submit'
    expect(current_path).to eq '/spaces'
    expect(page).to have_content('Welcome back, cooler_brad!')
  end
end