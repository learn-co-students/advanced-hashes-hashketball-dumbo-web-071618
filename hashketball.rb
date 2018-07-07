require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {
        "Alan Anderson" => {
          number: "0",
          shoe: "16",
          points: "22",
          rebounds: "12",
          assists: "12",
          steals: "3",
          blocks: "1",
          slam_dunks: "1"
        },
        "Reggie Evans" => {
          number: "30",
          shoe: "14",
          points: "12",
          rebounds: "12",
          assists: "12",
          steals: "12",
          blocks: "12",
          slam_dunks: "7"
        },
        "Brook Lopez" => {
          number: "11",
          shoe: "17",
          points: "17",
          rebounds: "19",
          assists: "10",
          steals: "3",
          blocks: "1",
          slam_dunks: "15"
        },
        "Mason Plumlee" => {
          number: "1",
          shoe: "19",
          points: "26",
          rebounds: "12",
          assists: "6",
          steals: "3",
          blocks: "8",
          slam_dunks: "5"
         },
         "Jason Terry" => {
            number: "31",
            shoe: "15",
            points: "19",
            rebounds: "2",
            assists: "2",
            steals: "4",
            blocks: "11",
            slam_dunks: "1"
         }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: "4",
          shoe: "18",
          points: "10",
          rebounds: "1",
          assists: "1",
          steals: "2",
          blocks: "7",
          slam_dunks: "2"
        },
        "Bismak Biyombo" => {
          number: "0",
          shoe: "16",
          points: "12",
          rebounds: "4",
          assists: "7",
          steals: "7",
          blocks: "15",
          slam_dunks: "10"
        },
        "DeSagna Diop" => {
          number: "2",
          shoe: "14",
          points: "24",
          rebounds: "12",
          assists: "12",
          steals: "4",
          blocks: "5",
          slam_dunks: "5"
        },
        "Ben Gordon" => {
          number: "8",
          shoe: "15",
          points: "33",
          rebounds: "3",
          assists: "2",
          steals: "1",
          blocks: "1",
          slam_dunks: "0"
         },
         "Brendan Haywood" => {
            number: "33",
            shoe: "15",
            points: "6",
            rebounds: "12",
            assists: "12",
            steals: "22",
            blocks: "5",
            slam_dunks: "12"
         }
      }
    }
  }
end

def good_practices game_hash
#are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!   
#what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        
  game_hash.each do |location, team_data|
    #location = :home or :away
    #team_data = the entire hashes of :home & :away
    team_data.each do |attribute, data|
      #attribute = below level of home or away ==> :team_name,:colors,:players
      #data = values pertaining to each attribute (i.e. Brooklyn Nets, Turquoise & Purple, Alan Anderson)
      if attribute == :players 
        data.each do |data_item, stats|
          #data_item = name of the players
          #stats = collection of statistics for each player
          stats.each do |category,datum|
            #category = number,shoe,etc 
            #datum = actual pieces of data for each category of the players' stats
          end
        end
      end
    end
  end
end

def num_points_scored player_name
  
  points_scored = ""
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, player_data|
          if players == player_name
            player_data.each do |category,datum|
              if category == :points 
                points_scored = datum 
              end
            end
          end
        end
      end
    end
  end
  points_scored.to_i
end

def shoe_size player_name
  size = ""
  game_hash.each do |team, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |players, player_data|
          if players == player_name
            player_data.each do |category,datum|
              if category == :shoe
                size = datum
              end
            end
          end
        end
      end
    end
  end
  size.to_i
end

def team_colors team_name
  colors = []
  bool = false 
  
  game_hash.each do |team,team_data|
    team_data.each do |attribute,info|
      bool = true if attribute == :team_name && info == team_name
      if bool == true && attribute == :colors
        bool = false
        colors = info
      end
    end
  end
  colors
end

def teams 
  
end

def team_names
  hash = game_hash
  
  teams = []
  hash.each do |teams_in_game,team_data|
    
    team_data.each do |attribute,info|
      
      if attribute == :team_name 
        
        teams << info 
      end
    end
  end
  teams
end

def player_numbers team_name
  numbers = []
  bool = false
  
  game_hash.each do |teams, team_data|
    team_data.each do |attribute,info|
      bool = true if attribute == :team_name && info == team_name
      if attribute == :players && bool == true 
        info.each do |players,player_data|
          player_data.each do |category,datum|
            numbers << datum.to_i if category == :number 
          end
          bool = false 
        end
      end
    end
  end
  numbers
end

def player_stats player_name
statistics = {}  
  game_hash.each do |teams,team_data|
    team_data.each do |attribute,info|
      if attribute == :players 
        info.each do |player,player_info|
          if player == player_name
            statistics = player_info
          end
        end
      end
    end
  end
  statistics.map do |category,datum|
    statistics[category] = datum.to_i
  end
  statistics
end

def big_shoe_rebounds
  largest_size = 0
  largest_mon = ""
  bool = false
  largest_mon_rebounds = 0
  
  game_hash.each do |teams,team_data|
    team_data.each do |attribute,info|
      if attribute == :players
        info.each do |player, player_info|

          player_info.each do |category,datum|
            if category == :shoe 
              if largest_size < datum.to_i
                largest_size = datum.to_i
                bool = true 
              end
            end
          end
          
          if bool == true
            largest_mon = player 
            bool = false
          end
          
          if largest_mon == player 
            player_info.each do |category, datum|
              if category == :rebounds
                largest_mon_rebounds = datum.to_i
              end
            end
          end
          
        end
      end
    end
  end
  
  largest_mon_rebounds
end

def most_points_scored
  player_with_most_pts = ""
  most_points = 0
  bool = false
  
  game_hash.each do |teams,team_data|
    team_data.each do |attributes,info|
      if attributes == :players 
        info.each do |player,player_info|
          
          player_info.each do |category,datum|
            if category == :points
              if most_points < datum.to_i 
                most_points = datum.to_i
                bool = true
              end
            end            
          end
          
          
          if bool == true 
            player_with_most_pts = player 
            bool = false
          end
          
        end
      end
    end
  end
  
  player_with_most_pts
end

def winning_team
  head_to_head = {}
  
  game_hash.each do |teams,team_data|
    score = 0
    squad = ""
    team_data.each do |attributes,info|
      if attributes == :team_name
        squad = info
      end
      if attributes == :players 
        info.each do |player, player_data|
          player_data.each do |category, datum|
            if category == :points 
              score += datum.to_i
            end
          end
        end
        head_to_head[squad] = score
      end
    end
    
  end
  team_on_top = ""
  most_points = 0
  head_to_head.each do |team,points_scored|
    if most_points < points_scored
      most_points = points_scored
      team_on_top = team 
    end
  end
  team_on_top
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |teams, team_data|
    team_data.each do |attributes,info|
      if attributes == :players 
        info.each do |player, player_data|
          if longest_name.length < player.length
            longest_name = player 
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  long_name_player = player_with_longest_name
  steals_by_LNP = 0 
  most_steals = 0 
  
  game_hash.each do |team,team_data|
    team_data.each do |attributes,info|
      if attributes == :players 
        info.each do |player,player_info|
          player_info.each do |category,datum|
            if category == :steals 
              if most_steals < datum.to_i
                most_steals = datum.to_i
              end
            end
          end
          if player == long_name_player
            player_info.each do |category,datum|
              if category == :steals
                steals_by_LNP = datum.to_i
              end
            end
          end
        end
      end
    end
  end
  
  steals_by_LNP >= most_steals ? true : false 
  
end