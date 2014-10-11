module PostPeep
  def _postone
    Peep.create(
      :peep => "My first peep example for testing",
      :user_id => 1
    )
  end
end