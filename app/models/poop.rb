class Poop
  include DataMapper::Resource

  property :id, Serial
  property :poop, String, :length => 144, :required => true
  property :created_at,      DateTime
  property :updated_at,      DateTime

  belongs_to :peep
end