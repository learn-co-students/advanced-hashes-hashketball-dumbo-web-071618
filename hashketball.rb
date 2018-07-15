require "pry"

def game_hash
  a_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {"Alan Anderson" => {
                  number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
                "Reggie Evans" => {
                  number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
                "Brook Lopez" => {
                  number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
                "Mason Plumlee" => {
                  number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
                "Jason Terry" => {
                  number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
            },
          },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {"Jeff Adrien" => {
                  number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
                "Bismak Biyombo" => {
                  number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
                "DeSagna Diop" => {
                  number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
                "Ben Gordon" => {
                  number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
                "Brendan Haywood" => {
                  number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
            },
          },
}
return a_hash
end

def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
  # binding.pry
end
# puts all_players.keys
# def both_locations
#   game_hash[:home].merge(game_hash[:away])
# end
# puts both_locations
# this does not work because .merge in this case since all keys are similar will replace first keys with the merger keys

def num_points_scored(player_name)
  all_players.each do |player, values|
    if player == player_name
      return values[:points]
    end
  end
end

def shoe_size(player_name)
  all_players.each do |player, value|
    if player == player_name
      return value[:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, attribute|
    if attribute[:team_name] == team_name
      #binding.pry
      return attribute[:colors]
    end
  end
end
# puts team_colors("Brooklyn Nets")
def team_names
  team_names_arr = []
  game_hash.each do |location, attribute|
    team_names_arr << attribute[:team_name]
  end
  # binding.pry
  team_names_arr
end
# puts team_names
def player_numbers(team_name)
  jersey_num_arr = []
  game_hash.each do |location, attribute|
    if attribute[:team_name] == team_name
      attribute[:players].each do |player, values|
        jersey_num_arr << values[:number]
      end
    end
  end
  jersey_num_arr
end

def player_stats(player_name)
  all_players.each do |player, values|
    if player == player_name
      return values
    end
  end
end

# def player_by_number(n)
#   #return the player who has n
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |player, stat|
#       if stat[:number] == n
#         return player
#       end
#     end
#   end
# end
#
# puts player_by_number(33)

def big_shoe_rebounds
  biggest_shoe_size = 0
  all_players.each do |player, values|
    # binding.pry
    if values[:shoe] > biggest_shoe_size
      biggest_shoe_size = values[:shoe]
      return values[:rebounds]
    end
  end
end
# #command d takes duplicates and renames
