require 'pry'

def game_hash

  game_hash = {

    home: {
      team_name: "Brooklyn Nets",

      colors: ["Black", "White"],

      players: {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },


##THIS IS THE AWAY TEAM


    away: {
      team_name: "Charlotte Hornets",

      colors: ["Turquoise", "Purple"],

      players: {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def find_team (name)
  game_hash.each do |location, team_details|
  if game_hash[location][:players].include? name
    return location
  end
  end
end

def num_points_scored (name)
game_hash[(find_team(name))][:players][name][:points]

#      team_details.each do |attributes, specifics|

#        if attributes == :players
#          specifics.each do |player_name, stats|
#            if player_name == name
#               return game_hash[location][attributes][name][:points]
    #         end
    #       end
    #     end
    #   end
    # end
end

def shoe_size (name)
  game_hash[(find_team(name))][:players][name][:shoe]
  # game_hash.each do |location, team_details|
  #
  #   team_details.each do |attributes, specifics|
  #
  #       if attributes == :players
  #         specifics.each do |player_name, stats|
  #           if player_name == name
  #              return game_hash[location][attributes][name][:shoe]
  #           end
  #         end
  #       end
  #     end
  #   end
end

def team_colors (team_name)
  game_hash.each do |location, team_details|
  if game_hash[location][:team_name].include? team_name
    return game_hash[location][:colors]
  # game_hash.each do |location, team_details|
  #
  #   team_details.each do |attributes, specifics|
  #
  #       if specifics == team_name
  #              return game_hash[location][:colors]
  #       end
  #     end
  #   end
end
end
end

def team_names
  team_names_array = []
    game_hash.each do |location, team_details|
      team_details.each do |attributes, specifics|
          if attributes == :team_name
            team_names_array << specifics
          end
        end
      end
 team_names_array
end

def player_numbers (team_name)
  team_jerseys_array = []
    game_hash.each do |location, team_details|
      team_details.each do |attributes, specifics|

          if specifics == team_name
              team_details.each do |attributes, specifics|
                if attributes == :players
                  specifics.each do |player_name, stats|
                    stats.each do |stat_name, stat_number|
                      if stat_name == :number
                        team_jerseys_array << stat_number
                      end
                    end
                  end
                end
              end
            end
          end
        end
 team_jerseys_array
end

def player_stats (name)
  game_hash.each do |location, team_details|

    team_details.each do |attributes, specifics|

        if attributes == :players
          specifics.each do |player_name, stats|
            if player_name == name
                return stats
              end
            end
          end
        end
      end
    end

def big_shoe_rebounds
biggest_shoe = 0
biggest_shoe_name = ""
  game_hash.each do |location, team_details|
    team_details.each do |attributes, specifics|
      if attributes == :players
        specifics.each do |player_name, stats|
          stats.each do |stat_name, stat_number|

            if stat_name == :shoe
              if stat_number > biggest_shoe
                  biggest_shoe = stat_number
                   biggest_shoe_name = player_name

                end
              end
            end
          end
        end
      end
    end
    game_hash.each do |location, team_details|
      team_details.each do |attributes, specifics|
        if attributes == :players
          specifics.each do |player_name, stats|
            if biggest_shoe_name == player_name
              stats.each do |stat_name, stat_number|
                  if stat_name == :rebounds
                    return stat_number
                  end
                end
              end
            end
          end
        end
      end
  end

  def most_points_scored
    biggest_score = 0
    biggest_score_name = ""
      game_hash.each do |location, team_details|
        team_details.each do |attributes, specifics|
          if attributes == :players
            specifics.each do |player_name, stats|
              stats.each do |stat_name, stat_number|
                if stat_name == :points
                  if stat_number > biggest_score
                      biggest_score = stat_number
                       biggest_score_name = player_name
                    end
                  end
                end
              end
            end
          end
        end
          biggest_score_name
      end

def winning_team
  home_score = 0
  away_score = 0
    game_hash.each do |location, team_details|
      if location == :home
      team_details.each do |attributes, specifics|
        if attributes == :players
          specifics.each do |player_name, stats|
            stats.each do |stat_name, stat_number|
              if stat_name == :points
                home_score = home_score + stat_number

        if location == :away
        team_details.each do |attributes, specifics|
          if attributes == :players
            specifics.each do |player_name, stats|
              stats.each do |stat_name, stat_number|
                if stat_name == :points
                  away_score = away_score + stat_number
                end
              end
            end
          end
        end
                end
              end
            end
          end
        end
      end
    end
  end

    if home_score > away_score
      return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
    end

end

def player_with_longest_name
        longest_name = ""
        game_hash.each do |location, team_details|
          team_details.each do |attributes, specifics|
            if attributes == :players
              specifics.each do |player_name, stats|
                if player_name.size > longest_name.size
                  longest_name = player_name
                end
              end
            end
          end
        end
        longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name

  most_steals = 0
  most_steals_name = ""
    game_hash.each do |location, team_details|
      team_details.each do |attributes, specifics|
        if attributes == :players
          specifics.each do |player_name, stats|
            stats.each do |stat_name, stat_number|
              if stat_name == :steals
                if stat_number > most_steals
                    most_steals = stat_number
                     most_steals_name = player_name
                   end
                 end
               end
             end
           end
         end
       end
  longest_name == most_steals_name
  end
