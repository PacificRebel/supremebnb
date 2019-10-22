feature 'Add new space listing' do
  scenario 'user can add space' do
    visit '/spaces/new'
    fill_in "name", with: "House"
    fill_in "description", with: "great"
    fill_in "price", with: "100"
    fill_in "start_date", with: "2019-11-27"
    fill_in "end_date", with: "2019-11-30"
    click_button "Submit"
puts Space.all
    space = Space.all.first
    expect(space.name).to eq "House"
    expect(space.description).to eq "great"
    expect(space.price).to eq 100
    expect(space.start_date).to be_a Date
    expect(space.end_date).to be_a Date
  end
end
