require 'spec_helper'

feature "OMG you can reply to a peep with a poop" do

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
    _poopone
  end

  scenario "I have to reply to this peep" do
     visit '/peeps/home'
     click_link 'poop'
     expect(page).to have_css 'textarea'
  end

  scenario "you cant poop bugger all" do
     visit '/'
     click_link 'poop'
     click_on 'Poop'
     expect(page).to have_content "You can't poop nout. Try again"   
  end

  scenario "I can see what other folk have pooped" do
     visit '/'
     expect(page).to have_content "a previous poop"
  end

end