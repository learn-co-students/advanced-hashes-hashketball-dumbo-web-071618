# Write your code here!
require 'pry'
def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: {
        'Alan Anderson' => {
              number: 0,
                shoe: 16,
              points: 22,
            rebounds: 12,
             assists: 12,
              steals: 3,
              blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans' => {
              number: 30,
                shoe: 14,
              points: 12,
            rebounds: 12,
             assists: 12,
              steals: 12,
              blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
              number: 11,
                shoe: 17,
              points: 17,
            rebounds: 19,
             assists: 10,
              steals: 3,
              blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee' => {
              number: 1,
                shoe: 19,
              points: 26,
            rebounds: 12,
             assists: 6,
              steals: 3,
              blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry' => {
              number: 31,
                shoe: 15,
              points: 19,
            rebounds: 2,
             assists: 2,
              steals: 4,
              blocks: 11,
          slam_dunks: 1
        }
      }
    },

    away: {
      team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: {
        'Jeff Adrien' => {
              number: 4,
                shoe: 18,
              points: 10,
            rebounds: 1,
             assists: 1,
              steals: 2,
              blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo' => {
              number: 0,
                shoe: 16,
              points: 12,
            rebounds: 4,
             assists: 7,
              steals: 7,
              blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
              number: 2,
                shoe: 14,
              points: 24,
            rebounds: 12,
             assists: 12,
              steals: 4,
              blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon' => {
              number: 8,
                shoe: 15,
              points: 33,
            rebounds: 3,
             assists: 2,
              steals: 1,
              blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
              number: 33,
                shoe: 15,
              points: 6,
            rebounds: 12,
             assists: 12,
              steals: 22,
              blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data[:points] if player == player_name
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data[:shoe] if player == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.map{ |team, team_data| team_data[:team_name] }
end

def player_numbers(team_name)
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      return team_data[:players].map { |player, player_data| player_data[:number] }
    end
  end
end

def player_stats(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      return player_data if player == player_name
    end
  end
end

def big_shoe_rebounds
  largest_shoe_player = { shoe: 0 }
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      if player_data[:shoe] > largest_shoe_player[:shoe]
        largest_shoe_player = player_data
      end
    end
  end
  largest_shoe_player[:rebounds]
end

def most_points_scored
  most_points_player = {name: '', points: 0 }
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      if player_data[:points] > most_points_player[:points]
        most_points_player[:name] = player
        most_points_player[:points] = player_data[:points]
      end
    end
  end
  most_points_player[:name]
end

def winning_team
  winning_team = {team_name: '', points: 0}

  game_hash.each do |team, team_data|
    current_team_points = 0
    team_data[:players].each do |name, data|
      current_team_points += data[:points]
    end

    if current_team_points > winning_team[:points]
      winning_team[:points] = current_team_points
      winning_team[:team_name] = team_data[:team_name]
    end
  end

  return winning_team[:team_name]
end

def player_with_longest_name
  longest_name = ''
  game_hash.each do |team, team_data|
    team_data[:players].each do |name, data|
      longest_name = name if name.length > longest_name.length
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  longest_name = {name: '', steals: 0}

  game_hash.each do |team, team_data|
    team_data[:players].each do |player, player_data|
      most_steals = player_data[:steals] if player_data[:steals] > most_steals
      if player.length > longest_name[:name].length
        longest_name[:name] = player
        longest_name[:steals] = player_data[:steals]
      end
    end
  end

  return longest_name[:steals] == most_steals
end
