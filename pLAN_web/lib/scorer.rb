require 'yaml'
require_relative 'objective'

def parse_file
  yaml_string = `nbt2yaml /var/games/minecraft/servers/pLAN/pLAN/data/scoreboard.dat`
  yaml_string = yaml_string.split("\n")[2..-1].join "\n"
  after_string = ''
  yaml_string.each_line do |line|
    line = line.sub( '-', '' )
    after_string << line
  end
  return YAML::load( after_string )
end

def get_objectives
  scoreboard = parse_file
  objectives = scoreboard['Objectives']
  player_scores = scoreboard['PlayerScores']
  return_objectives = {}

  objectives.each do |objective|
    newObjective = Objective.new( objective['Name'], objective['DisplayName'] )
    return_objectives[objective['Name']] = newObjective
  end

  player_scores.each do |score|
    objective = return_objectives[score['Objective']]
    objective.player_scores[score['Name']] = score['Score']
  end

  return return_objectives
end
