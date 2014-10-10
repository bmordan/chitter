require 'spec_helper'

describe User do
  it "adds a user" do
    User.create(
      :email => "test@test.org",
      :password => "passw0rd",
      :name => "User Name",
      :handle => "u5rnme"
    )
    user = User.first(:email => "test@test.org")
    expect(user.email).to eq("test@test.org")
  end
end