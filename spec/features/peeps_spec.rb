require 'spec_helper'

feature "Posting peeps is wicked because" do

  before(:each) do
    User.create(
      :email => "default@test.org",
      :password => "passw0rd",
      :name => "First User",
      :handle => "or1gin"
    )
  end

  before(:each) do
    _signin
    _postone
  end

  scenario "i can post a peep" do
    expect(Peep.count).to eq 1
  end

  scenario "i can see all the peeps in the world" do
    visit '/'
    expect(page).to have_css '.handle'
  end

end  