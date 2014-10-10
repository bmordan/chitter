require 'spec_helper'

feature "In order to use chitter I" do
  scenario "want to sing up" do
    signup
    expect(page).to have_content("Hay User Name")
  end

  scenario "need to be added to the users" do
    expect{ signup }.to change(User, :count).by 1
  end

end