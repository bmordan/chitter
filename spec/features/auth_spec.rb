require 'spec_helper'

feature "In order to use chitter I" do
  scenario "want to sing up" do
    visit '/signup'
    fill_in :email,    :with => "user@gmail.com"
    fill_in :name,     :with => "User Name"
    fill_in :handle,   :with => "username"
    fill_in :password, :with => "passw0rd"
    click_on 'Join Chitter'
  end
end