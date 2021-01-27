# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "start time is #{Time.now}"
puts "----------------------------------"

Scenario.destroy_all
Investigator.destroy_all
Token.destroy_all
Campaign.destroy_all
User.destroy_all

puts "creating user"

User.create!(email: "hsonn@test.com", username: "Hanna", password: "123456")
User.create!(email: "jkosch@test.com", username: "Jakob", password: "654321")

CAMPAIGN_NAME = ["core", "dwl", "ptc", "tfa", "tcu", "tde", "tic"]
DIFFICULTY = ["Easy", "Standard", "Hard", "Nightmare"]
TOKEN = [
  "+1", "0", "-1", "-2", "-3", "-4", "auto-fail", "cultist", "shield", "skull",
  "elder-sign", "tentacle"
]
INVESTIGATOR_NAME = ["Rex Murphy", "Agnes Baker", "Daisy Walker", "William Yorick"]
DECK_LINK = ["https://arkhamdb.com/decklist/view/101/knowledge-overwhelming-solo-deck-1.0"]
CAMPAIGN_LOG = [""]
SCENARIO_NAME = {
  core: ["The Gathering", "The Midnight Masks", "The Devourer Below"],
  dwl: [
    "Extracurricular Activity", "The House Always Wins", "The Miskatonic Museum",
    "The Essex County Express", "Blood on the Altar", "Undimensioned and Unseen",
    "Where Doom Awaits", "Lost in Time and Space"
  ],
  ptc: [
    "Curtain Call", "The Last King", "Echoes of the Past", "The Unspeakable Oath",
    "A Phantom of Truth", "The Pallid Mask", "Black Stars Rise", "Dim Carcosa"
  ],
  tfa: [
    "The Doom of Eztli", "The Untamed Wilds", "Threads of Fate", "The Boundary Beyond",
    "Heart of the Elders", "The City of Archives", "The Depths of Yoth", "Shattered Aeons"
  ],
  tcu: [
    "At Death's Doorstep", "Disappearance at the Twilight Estate", "The Witching Hour",
    "The Secret Name", "The Wages of Sin", "For the Greater Good", "Union and Disillusion",
    "In the Clutches of Chaos", "Before the Black Throne"
  ],
  tde: [
    "Beyond the Gates of Sleep", "Waking Nightmare", "The Search for Kadath",
    "A Thousand Shapes of Horror", "Dark Side of the Moon", "Point of No Return",
    "Where the Gods Dwell", "Weaver of the Cosmos"
  ],
  tic: [
    "The Pit of Despair", "The Vanishing of Elina Harper", "In Too Deep",
    "Devil Reef", "Horror in High Gear", "A Light in the Fog", "The Lair of Dagon",
    "Into the Maelstrom"
  ]
}
PLAYER_NAME = ["Hanna", "Jakob", "Niko", "Nancy"]


puts "creating campaigns"

User.all.each do |user|
  CAMPAIGN_NAME.each do |campaign_name|
    Campaign.create!(
      name: campaign_name,
      difficulty: DIFFICULTY.sample,
      completed: false,
      campaign_log: CAMPAIGN_LOG.sample,
      user: user
    )
  end
end

puts "creating tokens"

Campaign.all.each do |campaign|
  TOKEN.each do |token|
    Token.create!(
      token_type: token,
      campaign: campaign
    )
  end
end

puts "creating investigators"

Campaign.all.each do |campaign|
  INVESTIGATOR_NAME.each do |investigator|
    Investigator.create!(
      name: investigator,
      player_name: PLAYER_NAME.sample,
      deck_link: DECK_LINK.sample,
      physical_trauma: 0,
      mental_trauma: 0,
      unspent_experience_points: 0,
      campaign: campaign
    )
  end
end


puts "creating scenarios"

Campaign.all.each do |campaign|
  SCENARIO_NAME[campaign.name.to_sym].each_with_index do |scenario, index|
    Scenario.create!(
      name: scenario,
      scenario_nr: index + 1,
      completed: false,
      campaign: campaign
    )
  end
end


puts "#{User.count} new user created"
puts "#{Campaign.count} new campaign created"
puts "#{Token.count} new token created"
puts "#{Investigator.count} new investigator created"
puts "#{Scenario.count} new scenario created"


puts "end time is #{Time.now}"
