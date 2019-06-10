game = {
  :knicks => {
    :colors => ["orange", "blue"],

    :players => {
      "Carmelo Anthony" => {
        :number => 7,
        :shoe => 13,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Amare Stoudemire" => {
        :number => 1,
        :shoe => 16,
        :stats => {
          :points => 10000,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Iman Shumpert" => {
        :number => 21,
        :shoe => 14,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Tyson Chandler" => {
        :number => 6,
        :shoe => 12,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Pablo Prigioni asfadsfdsafdasfadsas" => {
        :number => 9,
        :shoe => 11,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 37,
          :blocks => 6,
          :slam_dunks => 5
        }
      }
    }
  },


  :celtics => {
    :colors => ["green", "white"],
    
    :players => {
      "Brandon Bass" => {
        :number => 30,
        :shoe => 13,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 20,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Keith Bogans" => {
        :number => 4,
        :shoe => 12,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Avery Bradley" => {
        :number => 0,
        :shoe => 14,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Jeff Green" => {
        :number => 8,
        :shoe => 20,
        :stats => {
          :points => 10,
          :rebounds => 4,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      },
      "Marshon Brooks" => {
        :number => 12,
        :shoe => 15,
        :stats => {
          :points => 10,
          :rebounds => 9,
          :assists => 8,
          :steals => 7,
          :blocks => 6,
          :slam_dunks => 5
        }
      }
    }
  }
}

# game
  #team
    #colors --> ARR
    #players
      #"Person"
        #number
        #shoe
        #stats
          #points
          #rebounds
          #assists
          #steals
          #blocks
          #slam_dunks


# Return the number of points scored for any player:
def points_for(player, game)
  game.each_value do |team, team_info|
    team[:players].each do |name, player_hash|
      if name == player
        points = player_hash[:stats][:points]
        puts "#{player} scored #{points} points."
      end
    end
  end
end

# Return the shoe size for any player:
def shoe_size_for(player, game)
  game.each_value do |team|
    team[:players].each do |name, player_hash|
      if name == player
        size = player_hash[:shoe].to_s
        puts "#{player} wears size #{size} shoe"
      end
    end
  end
end

# Return both colors for any team:
def team_colors_for(team, game)
  game.each do |team_name, team_info|
    if team_name.to_s == team
      tcolors = team_info[:colors].join(" ")
      puts "The #{team_name}' team colors are #{tcolors}."
    end
  end
end
 
# Return both teams names:
def what_teams?(game)
  team_arr = []
  game.each_key do |team|
    team_arr << team.to_s
  end

  teams_string = team_arr.join(" and ")
  puts "The teams playing are #{teams_string}."
end
 
# Return all the player numbers for a team:
def players_on_team(team, game)
  team_name = team.to_sym
  
  team_members = []
  game[team_name][:players].each_key do |player|
    team_members << player
  end

  team_string = team_members.join(", ")

  puts "The players on the #{team_name} are #{team_string}."
end
 
# Return all the stats for a player:
def player_stats_for(player, game)
    game.each_value do |team|
    team[:players].each do |name, player_hash|
      if name == player
        stats = player_hash[:stats].to_s
        puts "#{player}'s stats are #{stats}"
      end
    end
  end
end
 
# Return the rebounds for the player with the largest shoe size
def rebounds_for_bigfoot(game)
  biggest_foot = ["Default Name", 0, 0] # [Player, Shoe, Rebounds]

  game.each_value do |team|
    team[:players].each do |name, player_hash|

      if player_hash[:shoe] > biggest_foot[1]
        biggest_foot[0] = name
        biggest_foot[1] = player_hash[:shoe]
        biggest_foot[2] = player_hash[:stats][:rebounds]
      end

    end 
  end

  bigfoot_name = biggest_foot[0]
  bigfoot_shoe = biggest_foot[1]
  bigfoot_rebounds = biggest_foot[2]

  puts "#{bigfoot_name} has the biggest foot (size #{bigfoot_shoe}!) and has made #{bigfoot_rebounds} rebounds. Yowzahz! Mad rigorous."

end
 
rebounds_for_bigfoot(game)

# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?
def most_points?(game)
  highest_scorer = ["Default Name", 0] # [Name, high score]

  game.each_value do |team|
    team[:players].each do |name, player_hash|

      if player_hash[:stats][:points] > highest_scorer[1]
        highest_scorer[0] = name
        highest_scorer[1] = player_hash[:stats][:points]
      end

    end
  end

  top_name = highest_scorer[0]
  top_score = highest_scorer[1]

  puts "The highest scorer is #{top_name} and his score is #{top_score}. Daayuum!! Mad rigorous."

end
 
# Which team has the most points?
def current_winning_team(game)
  score_keeper = {}
  
  game.each do |team, team_info|
    score = 0

    team_info[:players].each_value do |player_info, info|
      score += player_info[:stats][:points]
    end
    
    score_keeper[team] = score

  end

  high_score = score_keeper.values.max
  high_scorer = score_keeper.key(high_score)

  puts "The winning team is #{high_scorer} with a score of #{high_score}. Yasss."

end
 
current_winning_team(game)

# Which player has the longest name?
def longest_name(game)
  longname = ["Default", 0] #[Name, length]

  game.each_value do |team, team_info|
    team[:players].each_key do |name|
      if name.length > longname[1]
        longname[0] = name
        longname[1] = name.length
      end
    end
  end

  bigname = longname[0]
  bigname_length = longname[1]
  puts "The longest name is #{bigname} with a length of #{bigname_length} characters! DAS IT."

  bigname
end

longest_name(game)

# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals.
def most_steals(game)
  big_steals = ["Default", 0] #[Name, steals]

  game.each_value do |team, team_info|
    team[:players].each do |name, player_info|
      if player_info[:stats][:steals] > big_steals[1]
        big_steals[0] = name
        big_steals[1] = player_info[:stats][:steals]
      end
    end
  end

  high_stealer = big_steals[0]
  high_steal_num = big_steals[1]
  puts "#{high_stealer} stole #{high_steal_num} times, the most out of them all!"

  high_stealer
end

most_steals(game)

def longest_name_most_steals(game)
  most_steals(game) == longest_name(game) ? true : false
end

puts longest_name_most_steals(game)