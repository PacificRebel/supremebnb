feature 'user login' do
  scenario 'user signs up' do
    visit '/'
    fill_in 'username', with: 'cool_kevin'
    click_button "Let's go"
    
    user = User.all.first
    expect(user.username).to eq 'cool_kevin'
  end

  scenario 'existing user logs in' do
    User.create(username: 'cooler_brad')
    visit '/'
    click_link 'Existing users sign in'
    fill_in 'username', with: 'cooler_brad'
    click_button 'Log in'
    expect(current_path).to eq '/spaces'
    expect(page).to have_content('Welcome back, cooler_brad!')
  end
end