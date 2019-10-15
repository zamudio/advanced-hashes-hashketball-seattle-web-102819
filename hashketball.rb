require "pry"

def game_hash
  {
    :home => { :team_name => "Brooklyn Nets",
                :colors => ["Black", "White"],
                :players => [
                  {:player_name => "Alan Anderson",
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                  },
                  {:player_name => "Reggie Evans",
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                  },
                  {:player_name => "Brook Lopez",
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
                  },
                  {:player_name => "Mason Plumlee",
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
                  },
                  {:player_name => "Jason Terry",
                  :number => 31,
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
                  }]
                },
    :away => {:team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"],
              :players => [
                {:player_name => "Jeff Adrien",
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2
                },
                {:player_name => "Bismack Biyombo",
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10
                },
                {:player_name => "DeSagna Diop",
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5
                },
                {:player_name => "Ben Gordon",
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0
                },
                {:player_name => "Kemba Walker",
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
                }]
              }
  }
end

def num_points_scored(player_name)
  game_hash.each do |home_away, team|
    team.each do |var, team_data|
      next unless var == :players
      team_data.each do |player|
        if player[:player_name] == player_name
          return player[:points]
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |home_away, team|
    team.each do |var, team_data|
      next unless var == :players
      team_data.each do |player|
        if player[:player_name] == player_name
          return player[:shoe]
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, team|
    if team[:team_name] == team_name
      return game_hash[home_away][:colors]
    end
  end
end

def team_names
  game_hash.collect do |home_away, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  player_nums = Array.new
  game_hash.each do |home_away, team|
    next unless team[:team_name] == team_name
    team.each do |var, team_data|
      next unless var == :players
      team_data.each do |team_data|
        player_nums << team_data[:number]
      end
    end
  end
  player_nums
end

def player_stats(player_name)
  player_hash = Hash.new
  game_hash.collect do |home_away, team|
    team.each do |var, team_data|
      next unless var == :players
      game_hash[home_away][var].each do |player|
        next unless player[:player_name] == player_name
        player_hash = player.delete_if do |key, value|
          key == :player_name
        end
      end
    end
  end
  player_hash
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  num_of_rebounds = 0
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:shoe] > biggest_shoe_size
        biggest_shoe_size = player[:shoe]
        num_of_rebounds = player[:rebounds]
      end
    end
  end
  num_of_rebounds
end

def most_points_scored
  points_scored = 0
  player_name = nil
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:points] > points_scored
        points_scored = player[:points]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def winning_team
  team_point_totals = {"Brooklyn Nets" => 0, "Charlotte Hornets" => 0}
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      team_point_totals[stats[:team_name]] += player[:points]
    end
  end
  team_point_totals.max_by{|key,val| val}.first
end

def player_with_longest_name
  player_name = nil
  name_length = 0
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:player_name].is_a? String
        if player[:player_name].length > name_length
          name_length = player[:player_name].length
          player_name = player[:player_name]
        end
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  steals = 0
  steal_player_name = nil
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:steals] > steals
        steals = player[:steals]
        steal_player_name = player[:player_name]
      end
    end
  end
  player_name = nil
  name_length = 0
  game_hash.each do |team, stats|
    stats[:players].each do |player|
      if player[:player_name].is_a? String
        if player[:player_name].length > name_length
          name_length = player[:player_name].length
          player_name = player[:player_name]
        end
      end
    end
  end
  if steal_player_name == player_name
    return true
  end
end