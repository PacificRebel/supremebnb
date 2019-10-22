describe User do

let(:space_class) { double(:space_class) }

subject(:user) {}

  it 'knows its username' do
    test_user = User.create(username: "Username")
    expect(test_user.username).to eq "Username"
  end
end
