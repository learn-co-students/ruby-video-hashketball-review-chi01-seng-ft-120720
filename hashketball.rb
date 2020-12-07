require 'pry'

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

def most_points_scored
  hash_points = Hash.new
  game_hash[:home][:players].each do |key, value|
    points = key[:points]
    player = key[:player_name]
    hash_points[player] = points
  end
  game_hash[:away][:players].each do |key, value|
    points = key[:points]
    player = key[:player_name]
    hash_points[player] = points
end
  hash_points.max_by { |player, points| points}
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |key, value|
    home_points += key[:points]
  end
  game_hash[:away][:players].each do | key, value|
    away_points += key[:points]
  end
  if home_points > away_points
    winner = game_hash[:home][:team_name]
  elsif
    away_points > home_points
    winner = game_hash[:away][:team_name]
  end
  winner
end

def player_with_longest_name
  name_array = Array.new
  count = 0
  length = 0
  longun = ""
     game_hash[:home][:players].map do |key, value|
        name_array.push(key[:player_name])
      end
         game_hash[:away][:players].map do |key, value|
        name_array.push(key[:player_name])
   count += 1
    end
  name_array.each do |name|
    if name.length > length
      longun = name
      length = name.length
    end
  end
  longun
end


def long_name_steals_a_ton?
  long_name = player_with_longest_name
  steal_hash = Hash.new
    game_hash[:home][:players].each do |key, value|
      steals = key[:steals]
      name = key[:player_name]
      steal_hash[name] = key[:steals]
    end
      game_hash[:away][:players].each do |key, value|
      steals = key[:steals]
      name = key[:player_name]
      steal_hash[name] = key[:steals]
    end
    steal_hash.max[0] == long_name
end
 

def team_names
  teams = Array.new
  game_hash.each do |court, categories|
    teams << categories[:team_name]
  end  
  teams
end

def team_colors(team)
  team_colors = Array.new
  game_hash.each do |court, categories|
    if categories[:team_name] == team
    team_colors = categories[:colors]
  end
  end  
  team_colors
end


def team(name)
    team_hash = Hash.new
     if game_hash[:home][:team_name] == name
       team_hash = game_hash[:home]
      elsif
      game_hash[:away][:team_name] == name
        team_hash = game_hash[:away]
      end
      team_hash
end


def team_player(player)
    player_hash = Hash.new
      game_hash[:home][:players].map do |key, value|
        if key[:player_name] == player
        player_hash = game_hash[:home][:players]
      end
    end
      game_hash[:away][:players].map do |key, value|
        if key[:player_name] == player
        player_hash = game_hash[:away][:players]
        end
    end
    player_hash
end


def find(player)
  player_hash = team_player(player)
  hash = Hash.new
  player_hash.map do |key, value| 
    name = key[:player_name]
    hash[name] = key
  end
  hash[player]
end


def player_stats(player)
  stats = find(player)
end


def num_points_scored(player)
  player = find(player)
  player[:points]
end


def shoe_size(player)
  player = find(player)
  player[:shoe]
end


def player_numbers(name)
    numbers = Array.new
    team_hash = team(name)
    team_hash[:players].each do |key, value|
      numbers << key[:number]
    end
    numbers
end


def big_shoe_rebounds
  foot_hash = Hash.new
  game_hash[:home][:players].each do |key, value|
      size = key[:shoe]
      rebounds = key[:rebounds]
      foot_hash[size] = key[:rebounds]
  end
  game_hash[:away][:players].each do |key, value|
      size = key[:shoe]
      rebounds = key[:rebounds]
      foot_hash[size] = key[:rebounds]
    end
    foot_hash.sort.max[1]
  end