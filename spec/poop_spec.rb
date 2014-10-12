require 'spec_helper'

describe Poop do

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

  it "can add a poop to a peep" do
    peep = Peep.last
    Poop.create(:poop => "a poop",:peep_id => peep.id)
    expect(Poop.count).to eq 1
  end

  it "will not work for empyt poops" do
    peep = Peep.last
    poop = Poop.create(:poop => "",:peep_id => peep.id)
    expect(poop.save).to be false
  end

end