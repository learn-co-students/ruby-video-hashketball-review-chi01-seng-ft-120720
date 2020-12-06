require "pry"
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


def num_points_scored(player)
  game_hash
  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if stats[:player_name] == player
        return stats[:points]
      end
    end
  end
end


def shoe_size(player)
  game_hash
  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if stats[:player_name] == player
        return stats[:shoe]
      end
    end
  end 
end


def team_colors(team)
  game_hash
  game_hash.each do |home_or_away, team_hash|
    if team_hash[:team_name] == team
      return team_hash[:colors]
    end
  end  
end   




def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]] 
end 



def player_numbers(team)
  game_hash
  new_array = []
  game_hash.each do |home_or_away, team_hash|
    if team_hash[:team_name] == team
      team_hash[:players].each do |stats|
        new_array << stats[:number]
      end
    end
  end 
  new_array
end


def player_stats(player)
  game_hash
  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if stats[:player_name] == player
        return stats
      end
    end 
  end
end 


def big_shoe_rebounds
  game_hash

  biggest_shoe = nil  
  biggest_rebounds = nil
  
  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if biggest_shoe == nil
        biggest_shoe = stats[:shoe]
        biggest_rebounds = stats[:rebounds]
      elsif biggest_shoe < stats[:shoe]
        biggest_shoe = stats[:shoe]
        biggest_rebounds = stats[:rebounds]         
      end
    end
  end
  biggest_rebounds
end


def most_points_scored
  game_hash

  most_points_scored = nil  
  player_name = nil
 
  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if most_points_scored == nil
        most_points_scored = stats[:points]
        player_name = stats[:player_name]
      elsif most_points_scored < stats[:points]
        most_points_scored = stats[:points]
        player_name = stats[:player_name]  
      end 
    end 
  end 
 player_name 
end


def winning_team
  game_hash
  
  home_array = game_hash[:home][:players].collect do |stats|
    stats[:points]
  end
  
  away_array = game_hash[:away][:players].collect do |stats|
    stats[:points]
  end
  
  if home_array.sum > away_array.sum 
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end 
 
end 


def player_with_longest_name
  game_hash

  longest_name_length = nil  
  player_name = nil
  
  
  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if longest_name_length == nil
        longest_name_length = stats[:player_name].length
        player_name = stats[:player_name]
      elsif longest_name_length < stats[:player_name].length
        longest_name_length = stats[:player_name].length
        player_name = stats[:player_name]
      end
    end 
  end
 return player_name
end


def long_name_steals_a_ton?
  game_hash
  longest_name = player_with_longest_name
  most_steals = nil  
  player_name = nil

  game_hash.each do |home_or_away, team_hash|
    team_hash[:players].each do |stats|
      if most_steals == nil
        most_steals = stats[:steals]
        player_name = stats[:player_name]
      elsif most_steals < stats[:steals]
        most_steals = stats[:steals]
        player_name = stats[:player_name]
      end
    end 
  end
  
  if player_name == longest_name
    return true 
  else 
    return false
  end 
end 

# Write code here