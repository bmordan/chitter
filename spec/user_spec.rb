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

  it "authenticates - nil for a wrong password" do
    user = User.authenticate("or1gin","wrong_password")
    expect(user).to eq  nil
  end

  it "authenticates - user if password is correct" do
    User.create(:password => "passw0rd",:handle => "or1gin")    
    user = User.authenticate("or1gin","passw0rd")
    expect(user.handle).to eq "or1gin"
  end
end