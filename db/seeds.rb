# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
WAGERS = [
  "Friendly",
  "Money",
  "Dinner",
  "Other"
]

WAGERS.each do |wager|
  Wager.find_or_create_by!(name: wager)
end

# users
User.create(
  username: "RikerNumber1",
  email: 'riker1@gmail.com',
  password: "password"
  )

User.create(
  username: "BrainFreeze",
  email: 'brainfreeze@gmail.com',
  password: "password"
  )

User.create(
  username: "SutterCane",
  email: 'sc@gmail.com',
  password: "password"
  )

User.create(
  username: "DrDidg",
  email: 'drdidg@gmail.com',
  password: "password"
  )

User.create(
  username: "ChunkyLover53",
  email: 'chunky@gmail.com',
  password: "password"
  )

# bets pending
Bet.create(
  sender: User.first,
  receiver: User.third,
  title: "Science or Magic?",
  body: "Which is better scinece of magic, Suttercane says Magic.
    Which ever gets 5 comments first wins",
  wager: Wager.first
  )

Bet.create(
  sender: User.second,
  receiver: User.last,
  title: "3 point bball contest",
  body: "First one around the world wins, loser buy burritos!",
  wager: Wager.third
  )

Bet.create(
  sender: User.fourth,
  receiver: User.first,
  title: "Beard contest",
  body: "First one to shave or trim their beard loses... Make it so!",
  wager: Wager.first
  )

Bet.create(
  sender: User.first,
  receiver: User.last,
  title: "MVP for NFL 2016",
  body: "Riker says, Tom Brady. Chunky is going with Aaron Rogers",
  wager: Wager.first
  )

Bet.create(
  sender: User.second,
  receiver: User.third,
  title: "DateNight",
  body: "Who ever gets a date first wins... Strictly a gentlemens bet.",
  wager: Wager.last
  )

Bet.create(
  sender: User.last,
  receiver: User.second,
  title: "Hotdog!",
  body: "Who can eat the most hotdogs in 5 mins. ",
  wager: Wager.first
  )

Bet.create(
  sender: User.third,
  receiver: User.first,
  title: "Mile Run",
  body: "A good ole fashion footrace next sunday(weather permitting)",
  wager: Wager.third
  )

# active bets
Bet.create(
  sender: User.first,
  receiver: User.last,
  title: "MVP for NBA 2016",
  body: "Riker says, Kevin Durant. Chunky is going with LeBron James",
  wager: Wager.first,
  accepted: true
  )

Bet.create(
  sender: User.second,
  receiver: User.third,
  title: "One on One, Bball",
  body: "Game to 11, winners keep and score by one's and two's... Lets do THIS",
  wager: Wager.last,
  accepted: true
  )

Bet.create(
  sender: User.first,
  receiver: User.fourth,
  title: "Hotdog!",
  body: "Who can eat the most hotdogs in 5 mins. ",
  wager: Wager.first,
  accepted: true
  )

Bet.create(
  sender: User.second,
  receiver: User.last,
  title: "5k Run",
  body: "A good ole fashion footrace next sunday(weather permitting)",
  wager: Wager.third,
  accepted: true
  )
