module SignUp
  def signup(email = "test@test.org",password = "passw0rd")
    visit '/'
    fill_in :email,    :with => email
    fill_in :name,     :with => "User Name"
    fill_in :handle,   :with => "username"
    fill_in :password, :with => password
    click_on 'Join Chitter'    
  end
end