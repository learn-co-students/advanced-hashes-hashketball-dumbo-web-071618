# Write your code here!
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets" ,
      :colors => ["Black","White"] ,
      :players => {
              "Alan Anderson" => {
                :number => 0 ,
                :shoe => 16 ,
                :points => 22 ,
                :rebounds => 12 ,
                :assists => 12 ,
                :steals => 3 ,
                :blocks => 1 ,
                :slam_dunks => 1 } , 
              "Reggie Evans" => {
                :number => 30 ,
                :shoe => 14 ,
                :points => 12 ,
                :rebounds => 12 ,
                :assists => 12 ,
                :steals => 12 ,
                :blocks => 12 ,
                :slam_dunks => 7 } ,  
              "Brook Lopez" => {
                :number => 11 ,
                :shoe => 17 ,
                :points => 17 ,
                :rebounds => 19 ,
                :assists => 10 ,
                :steals => 3 ,
                :blocks => 1 ,
                :slam_dunks => 15 } , 
              "Mason Plumlee" => {
                :number => 1 ,
                :shoe => 19 ,
                :points => 26 ,
                :rebounds => 12 ,
                :assists => 6 ,
                :steals => 3 ,
                :blocks => 8 ,
                :slam_dunks => 5 } , 
              "Jason Terry" => {
                :number => 31 ,
                :shoe => 15 ,
                :points => 19 ,
                :rebounds => 2 ,
                :assists => 2 ,
                :steals => 4 ,
                :blocks => 11 ,
                :slam_dunks => 1 }
                  }
    },
    :away => {
     :team_name => "Charlotte Hornets" ,
      :colors => ["Turquoise", "Purple"] ,
       :players => {
              "Jeff Adrien" => {
                :number => 4 ,
                :shoe => 18 ,
                :points => 10 ,
                :rebounds => 1 ,
                :assists => 1 ,
                :steals => 2 ,
                :blocks => 7 ,
                :slam_dunks => 2 } , 
              "Bismak Biyombo" => {
                :number => 0 ,
                :shoe => 16 ,
                :points => 12 ,
                :rebounds => 4 ,
                :assists => 7 ,
                :steals => 7 ,
                :blocks => 15 ,
                :slam_dunks => 10 } ,  
              "DeSagna Diop" => {
                :number => 2 ,
                :shoe => 14 ,
                :points => 24 ,
                :rebounds => 12 ,
                :assists => 12 ,
                :steals => 4 ,
                :blocks => 5 ,
                :slam_dunks => 5 } , 
              "Ben Gordon" => {
                :number => 8 ,
                :shoe => 15 ,
                :points => 33 ,
                :rebounds => 3 ,
                :assists => 2 ,
                :steals => 1 ,
                :blocks => 1 ,
                :slam_dunks => 0  } , 
              "Brendan Haywood" => {
                :number => 33 ,
                :shoe => 15 ,
                :points => 6 ,
                :rebounds => 12 ,
                :assists => 12 ,
                :steals => 22 ,
                :blocks => 5 ,
                :slam_dunks => 12 }
                  }
              }   
            }
end


def num_points_scored(player_name) 
 if home_and_away_players.keys.include?(player_name)
    home_and_away_players["#{player_name}"][:points]
 end  
end
 
def shoe_size(player_name)  
  if home_and_away_players.keys.include?(player_name)
  home_and_away_players["#{player_name}"][:shoe]
  end 
end 

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
     game_hash[:home][:colors]
 elsif game_hash[:away][:team_name] == team_name
       game_hash[:away][:colors]
 end  
end

def team_names
  teamsArray = []
  teamsArray << game_hash[:home][:team_name]
  teamsArray << game_hash[:away][:team_name]
  teamsArray
end


def player_numbers(team_name)
  numList = []
  if game_hash[:home][:team_name] == team_name
     game_hash[:home][:players].each do |name,stat_list|
       stat_list.each do |stat, value|
        if stat == :number   
        numList << value
        end
       end 
     end
  elsif game_hash[:away][:team_name] == team_name
        game_hash[:away][:players].each do |player,stat_list|
        stat_list.each do |stat, value|
          if stat == :number   
          numList << value
          end
        end
        end
  end 
  numList
end

def player_stats(name)
  if    home_and_away_players.keys.include?(name)
        home_and_away_players[name]
  end 
end

def home_and_away_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end 

def big_shoe_rebounds
  rebounds = 0
  biggest_shoe = 0
  home_and_away_players.each do |player, player_hash|
    if player_hash[:shoe] > biggest_shoe 
      biggest_shoe = player_hash[:shoe]
       rebounds = player_hash[:rebounds]
     end
  end  
  rebounds
end  


  
   