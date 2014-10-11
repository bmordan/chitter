require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,              Serial
  property :email,           String, :unique => true, :message => "That email is already taken"
  property :name,            String
  property :handle,          String, :unique => true, :message => "That handle is in use, sorry try another"
  property :password_digest, Text,   :lazy   => false
  property :created_at,      DateTime
  property :updated_at,      DateTime

  attr_reader :password
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(handle,password)
    user = first(:handle => handle)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end