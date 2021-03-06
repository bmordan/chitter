require 'spec_helper'

feature "In order to use chitter I" do

  before(:each) do
    User.create(
      :email => "default@test.org",
      :password => "passw0rd",
      :name => "First User",
      :handle => "or1gin"
    )
  end

  scenario "want to sing up" do
    _signup
    expect(page).to have_css(".fa-sign-out")
  end

  scenario "join the users table" do
    _signup
    expect(User.count).to eq 2
  end

  scenario "have my password stored securely" do
    user = User.first
    expect(user.password_digest).to_not eq("passw0rd")
  end

  scenario "want to sign in with my password" do
    _signin
    expect(page).to_not have_content 'log in'
    expect(page).to have_css '.fa-plus'
  end

  scenario "have confidence the wrong password is not accepted" do
    _wrongin
    expect(page).to have_css '.flash', :text => "Thats not or1gin's password"
  end

  scenario "want to log out" do
    _signin
    click_link 'sign out'
    expect(page).to have_content "You have logged out"
  end

  scenario "when logged out I am unable to post peeps" do
     _signin
    click_link 'sign out'
    expect(page).to_not have_content 'my peeps'
  end

end
