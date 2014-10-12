module PostPeep
  def _postone
    user = User.last
    Peep.create(
      :peep => "My first peep example for testing",
      :user_id => user.id
    )
  end
end