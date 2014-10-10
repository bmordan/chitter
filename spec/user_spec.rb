require_relative '../app/models/user'

describe User do
  it "adds a user" do
    User.create(:email => "test@test.org")
    user = User.first(:email => "test@test.org")
    expect(user.email).to eq("test@test.org")
  end
end