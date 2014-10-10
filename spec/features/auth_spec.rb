require 'spec_helper'

feature "In order to use chitter I" do

  before(:each) do
    User.create(
      :email => "test@test.org",
      :password => "passw0rd",
      :name => "User Name",
      :handle => "u5rnme"
    )
  end

  scenario "want to sing up" do
    signup
    expect(page).to have_content("Hay User Name")
  end

  scenario "join the users table" do
    expect(User.count).to eq 1
  end

  scenario "have my password stored securely" do
    user = User.first
    expect(user.password_digest).to_not eq("passw0rd")
  end

  scenario "want to sign in with my password" do
    visit '/peeps/home'
    click_link 'log in'
    expect(page).to have_css('input')
  end

end