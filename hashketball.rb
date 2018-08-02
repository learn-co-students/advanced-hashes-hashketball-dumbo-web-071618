require "pry"

# def num_points_scored(players)
  
# end

  def game_hash
  {
    :home => {
      :team_name =>"Brooklyn Nets",
        :colors => ["Black","White"],
          :players => {
          "Alan Anderson" => {number: 0, shoe: 16, points: 22,rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1  },
          
          "Reggie Evans" => {number: 30, shoe: 14, points: 12,rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7  },
          
          "Brook Lopez" => {number: 11, shoe: 17, points: 17,rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15  },
          
          "Mason Plumlee" => {number: 1, shoe: 19, points: 26,rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5  },
          
          "Jason Terry" => {number: 31, shoe: 15, points: 19,rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
            }
        },
    :away => {
      :team_name => "Charlotte Hornets",
        :colors => ["Turquoise","Purple"],
          :players => {
          "Jeff Adrien" => {number: 4, shoe: 18, points: 10,rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2  },
          
          "Bismak Biyombo" => {number: 0, shoe: 16, points: 12,rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10  },
          
          "DeSagna Diop" => {number: 2, shoe: 14, points: 24,rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5  },
          
          "Ben Gordon" => {number: 8, shoe: 15, points: 33,rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0  },
          
          "Brendan Haywood" => {number: 33, shoe: 15, points: 6,rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12  }
        
      }
    }
  }

  # contacts.each do |name, data|
  #   data.each do |keys, values|
  #     if keys == :favorite_icecream_flavors
  #       values.delete_if {|x| x == "strawberry"}
  #     end
  #   end
  # end
end

def num_points_scored (name)
  answer = nil

  game_hash.each do |team, details_hash|
    # binding.pry
    players_array = details_hash[:players]
      players_array.each do |player, player_details_hash|
        #binding.pry
        if player == name
          answer = player_details_hash[:points]
        end
      end
  end
  answer.to_i
end


# shoe size of each player #
def shoe_size(name)
  answer = nil

  game_hash.each do |team, details_hash|
    # binding.pry
    players_array = details_hash[:players]
      players_array.each do |player, player_details_hash|
        #binding.pry
        if player == name
          answer = player_details_hash[:shoe]
        end
      end
  end
  answer.to_i
end


def team_colors(name)
  if name == "Brooklyn Nets"
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
end
end

def team_names
  array = Array.new
  
  home =game_hash[:home][:team_name]
  away =game_hash[:away][:team_name]
  
  array << home
  array << away
  # binding.pry
end
team_names


#go into Brooklyn nets
def player_num 
  p_num= game_hash[:home][:players]["Alan Anderson"][:number]
  p_num.to_i
# binding.pry
end
player_num 


def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |team, attributes|
    #binding.pry
    game_hash[team].each do |attribute, value|
      #binding.pry
      if value == team_name
        game_hash[team][:players].each do |name, stats|
          #binding.pry
          game_hash[team][:players][name].each do |stat, val|
            #binding.pry
            if stat == :number
              player_numbers << val.to_i
            end
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(name)
  answer = nil

  game_hash.each do |team, details_hash|
     #binding.pry
    players_array = details_hash[:players]
      players_array.each do |player, player_details_hash|
        #binding.pry
        if player == name
          answer = player_details_hash
        end
      end
  end
  answer
end

# def big_shoe_rebounds
#   game_hash.each do |team, details_hash|
#     #binding.pry
#     players_array = details_hash[:players]
#       players_array.each do |player, player_details_hash|
#         binding.pry
#           player_details_hash.max_by {|k,v| v}
#             #binding.pry
#           #end
#         #end
#       end
#   end
# end


def big_shoe_rebounds
  answer = nil

  game_hash.each do |team, details_hash|
    #binding.pry
    players_array = details_hash[:players]
      players_array.each do |player, player_details_hash|
        #binding.pry
          player_details_hash.each do |ke, va|
            if ke == :rebounds
              answer = player_details_hash[:rebounds]
            #binding.pry
          end
          end
      end
  end
  answer.to_i
end