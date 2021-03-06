require 'pry'

def game_hash
  {#each team has 3 keys: team_name:string, colors:array, and players:hash
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [#hash of players with attributes: player_name, number, shoe, points, rebounds, etc.
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
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
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
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# def good_practice(game_hash)
#   game_hash.each do |location, team_data|
#     binding.pry
#     team_data.each do |attribute, data|
#       binding.pry
#         if attribute != :team_name
#           data.each do |data_item|
#           binding.pry
#         end
#       end
#     end
#   end
# end

def grab_team_data
  # collecting players team data of two team to an array
  team_players_array = game_hash.values.collect {|team_data| team_data[:players]}
  # 2 set of arrays => 1
  team_players_array.flatten
end


#create method to pull data_item from player team data
def grab_player_data(player,data_item)
  answer = nil
  all_players = grab_team_data
  all_players.each do |data|
    if data[:player_name] == player
      answer = data[data_item]
    end
  end
  answer
end

def num_points_scored(player_name)
  grab_player_data(player_name,:points)
end

def shoe_size(player_name)
  grab_player_data(player_name,:shoe)
end

def team_colors(team_name)
  team = game_hash.values.find {|team_data|
    team_data[:team_name] == team_name}
    team[:colors]
end

def team_names
  game_hash.collect {|location,team_data| team_data[:team_name]}
end

def player_numbers(team_name)
  team = game_hash.values.find {|team_data|
    team_data[:team_name] == team_name}
  team[:players].collect {|data| data[:number]}
end

def big_shoe_rebounds
  biggest_shoe = 0
  biggest_shoe_player=""
  all_players = grab_team_data
    all_players.each do |team_data|
      if team_data[:shoe] > biggest_shoe
          biggest_shoe = team_data[:shoe]
          biggest_shoe_player = team_data[:player_name]
      end
    end
  rebound = grab_player_data(biggest_shoe_player,:rebounds)
  # "#{biggest_shoe_player} has biggest shoe #{biggest_shoe} and his rebounds is #{rebound}"
end
