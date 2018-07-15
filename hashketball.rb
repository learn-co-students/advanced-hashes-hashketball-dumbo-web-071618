# Write your code here!
require 'pry'

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end


def all_players
  home_team_players = game_hash[:home][:players]
   away_team_players = game_hash[:away][:players]
  home_team_players.concat(away_team_players)
  
  
  
end 


 def num_points_scored(players_name)
   
   all_players.find {|players| players[:name] == players_name}.fetch(:points)
  
     
     
   
 end 
 
 def shoe_size(player)
    all_players.find {|players| players[:name] == player}.fetch(:shoe)
   
   
   
 end
 
 def team_colors(team) 
   
   team == game_hash[:home][:team_name] ? game_hash[:home][:colors] : game_hash[:away][:colors]
   
   
 end 


def team_names
 ht = game_hash[:home][:team_name]
 at = game_hash[:away][:team_name]
 [ht,at]
  
end 


def player_numbers (team_name)
 arr = []
  game_hash.each do |key, values|
    if values[:team_name] == team_name
      values[:players].each do |player|
        player.each do |k, v|
          if k == :number 
            arr << v
          end
        end
      end
    end
  end
 arr
end



def player_stats(player_name)
   ans = all_players.find {|players| players[:name] == player_name}
   ans.delete(:name)
   ans
  
  
  
end 



def big_shoe_rebounds
  biggest_shoe_size = 0 
  rebounds = 0 
  game_hash.each do |key, values| 
    values[:players].each do |data| 
      if data[:shoe] > biggest_shoe_size 
        biggest_shoe_size = data[:shoe]
        rebounds = data[:rebounds]
      
    end 
  end
  end 
  rebounds
  
end 
