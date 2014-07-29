class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: "Team"
  belongs_to :visitor_team, class_name: "Team"
  belongs_to :toto_form

  store_accessor :stats, :draw_votes, :home_team_votes, :visitor_team_votes
  validates :draw_votes, :home_team_votes, :visitor_team_votes, numericality: true, allow_blank: true

  validates :visitor_team_id, :home_team_id, presence: true
  validates :result, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }, allow_blank: true

  %w[draw_votes home_team_votes visitor_team_votes].each do |key|
    define_method(key) do
      stats && stats[key].to_i
    end
  end

  def suggested_results
    max_votes = stats.values.map{|v| v.to_i}.max
    stats.values.map.with_index {|e, i| e.to_i == max_votes ? i : nil}.compact
  end
end
