# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end 

def num_points_scored(players_name)

  game_hash.each do |location, team_data|
    #location is :home & :away
    #team_data hash of :team_name => (string), :colors = >(array of strings), :players => (an array of hashes)
    
    team_data.each do |attribute, players_array|
      #attribute is :team_name, :colors, :players
      #players_array is array of players
      
      if attribute == :players
        players_array.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
          #if player clear
      end
      #players_array.each end
      end
      #if attribute end
    end
    #team_data.each end
end
#game_hash.each end
end
#end of method

#changed one symbol of :shoe in method

def shoe_size(players_name)
   game_hash.each do |location, team_data|
    team_data.each do |attribute, players_array|
     if attribute == :players
        players_array.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
      end
  end   
 end 
end
end
 
def team_colors(name_of_team)
    game_hash.each do |location, team_data|
      if game_hash[location][:team_name] == name_of_team
        return game_hash[location][:colors]
  end
end
end

def team_names
  array_of_teams = [ ]
  home = game_hash[:home][:team_name]
  away = game_hash[:away][:team_name]
  array_of_teams = [home, away]
end


def player_numbers(name_of_team)
brooklyn_numbers = [ ] 
charlotte_numbers = [ ]

if game_hash[:home][:team_name].include?(name_of_team)
  counter = 0 
  while counter < game_hash[:home][:players].length do
    brooklyn_numbers << game_hash[:home][:players][counter][:number]
    counter += 1
  end
    return brooklyn_numbers
elsif game_hash[:away][:team_name].include?(name_of_team)
 counter = 0 
  while counter < game_hash[:away][:players].length do
    charlotte_numbers << game_hash[:away][:players][counter][:number]
    counter += 1
  end
    return charlotte_numbers
end
end



def big_shoe_rebounds
biggest_shoe = 0 
big_shoe_rebounds = 0
player_name = " "

game_hash.each do |location, team_data|
  team_data[:players].each do |players|
    shoe_size = players[:shoe]
    if shoe_size > biggest_shoe
      biggest_shoe = shoe_size
      big_shoe_rebounds = players[:rebounds]
      player_name = players[:player_name]
    end
end
end
#puts "#{player_name} has the biggest shoe size: #{biggest_shoe} and #{big_shoe_rebounds} rebounds"
return big_shoe_rebounds
end

def player_stats(name_of_player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |players|
      if players[:player_name] == (name_of_player)
        return players
      end
    end
  end
end