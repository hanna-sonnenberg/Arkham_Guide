class Scenario < ApplicationRecord
  def self.scenario_name 
    {
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
  end

  belongs_to :campaign

  validates :name, presence: true
  validates :scenario_nr, presence: true
end
