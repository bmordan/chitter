require 'spec_helper'

describe Peep do

  before(:each) do
   User.create(
      :email => "test@test.org",
      :password => "passw0rd",
      :name => "User Name",
      :handle => "u5rnme"
    )
    user = User.last
    Peep.create(
      :peep => "My first peep example for testing",
      :user_id => user.id
    )
  end

  it "can add a peep" do
    expect(Peep.count).to eq 1
  end

  it "refuses empty peeps" do
    user = User.last
    empty = Peep.create(
      :peep => "",
      :user_id => user.id
    )
    expect(empty.save).to be false
  end
end