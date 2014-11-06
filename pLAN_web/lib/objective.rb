class Objective
  attr_accessor :objective_name, :display_name, :player_scores

  def initialize( objective_name, display_name )
    @objective_name = objective_name
    @display_name = display_name
    @player_scores = {}
  end

  def sorted_scores
    return @player_scores.sort_by { |player_name, score| score }.reverse
  end
end
