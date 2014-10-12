module PostPeep
  def _postone
    user = User.last
    Peep.create(
      :peep => "My first peep example for testing",
      :user_id => user.id
    )
  end

  def _poopone
    peep = Peep.last
    Poop.create(:poop => "a previous poop",:peep_id => peep.id)
  end
end