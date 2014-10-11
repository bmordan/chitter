require 'spec_helper'

feature "Posting peeps is wicked because" do

  before(:each) do
    _signin
    _postone
  end

  scenario "i can post a peep" do
    expect(Peep.count).to eq 1
  end

end  