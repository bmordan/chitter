require 'database_cleaner'
module Seed
  def _seed_users
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    User.create(
      :name => "Luke Skywalker",
      :email => "luke@badfeeling.net",
      :handle => "red5",
      :password => "password")
    User.create(
      :name => "Darth Vader",
      :email => "black@badfeeling.net",
      :handle => "darth",
      :password => "password")
    User.create(
      :name => "Princess Leia",
      :email => "Leia@badfeeling.net",
      :handle => "princess",
      :password => "password")
  end

  def _seed_peeps
    users = User.all
    users.each do |user|
      9.times {Peep.create(:peep => peepsample,:user_id => user.id)}
    end
  end

  def peepsample
    peep = [
      "Food trucks: Because the problem with most grilled cheese sandwiches is you don't spend 20 minutes breathing exhaust.",
      "Wait so does Smashing Pumpkins refer to destroying pumpkins or are they just super good pumpkins in England",
      "dear matt Damon for Halloween I think you should go as Matt Demon or Good Will Haunting. text me if you do",
      "Carrots are a great thing to eat when you are hungry and want to stay that way.",
      "*doesn't look up from phone* I do",
      "Two types of people from small towns: 1. Let's leave after high school and find culture! 2. Where is everyone? Better make some new people!",
      "Scientists confirm the human body is 75% water, still unclear what the other 25% is, 'spaghetti we think' says one scientist",
      "apparently some people have been using wind to take the leaves from my frontyard and put them other places. they are still mine regardles",
      "Missed connection. You cut in front of me at Starbucks in May, 2009. I finally thought up a witty response.",
      "Plug your headphones into a banana. Everyone will leave you alone twice as much.",
      "some terrible part of me is perpetually close to just making and selling artisinal customized tamagotchis & bein real pretentious about it",
      "There's an emoji for eggplants but not for popcorn and this is why trusting people isn't just hard it's impossible.",
      "DATING TIP: Play hard to get. Train to be an astronaut. Fly into space and leave Earth behind. Then text your crush and be like what's up?",
      "Just because this is a public space doesn't mean my tweets are meant for ALL of you to read! Please respect my privacy at this time!!!",
      "Yosemite Sam would use the N-word.",
      "Everybody was Kung Fu fighting. Except Gary. Gary was in your house going through your underwear drawer. He also kissed your cat.",
      "You know you're old when the band you love plays an encore and it just stresses you out because you have work tomorrow and need to get home.",
      "walks up to a group of sad people at a funeral* Do y'all know the wifi password",
      "A complete list of movie roles turned down by Nicolas Cage:",
      "Dinner party tip: Gluten allergies can easily be treated by not telling people they are consuming gluten.",
      "Play Mambo No. 5 at my funeral even if you have to fight my family",
      "If you're an adult and you aren't tired, you probably just fell asleep and started dreaming. Wake up. It's time to be tired again.",
      "When God invented snakes he was like do you want legs or do you want to look like a scary belt, too late scary belt",
      "*sees old person* why don't u just die already *sees young person* u think u know shit... but u don't *sees middle-aged person* fuck u, pal",
      "Tomorrow is International Cook a Steak and Then Throw It to a Seagull Day. Get involved. Don't question it.",
      "It’s hard to get a lot done when you’re busy having a snack every 15 minutes",
      "home alone: my favorite movie and also my hobby",
      "New rule for football: when a player is at the bottom of a pile after being tackled everyone on top has to whisper to him a compliment",
      "I thought I was having a pretty productive day until I realized my phone is set to west coast time and I'm in NJ",
      "If someone broke up with me (doubtful) I would say 'Ok weird eyes' Even if their eyes weren't weird id say it. Because they'd always wonder"]
    peep.sample
  end
end