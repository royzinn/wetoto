class Team < ActiveRecord::Base
  attr_accessor :country

  has_many :matches_as_home_team, class_name: "Match", foreign_key: "home_team_id"
  has_many :matches_as_visitor_team, class_name: "Match", foreign_key: "visitor_team_id"

  validates :country, :name, presence: true
  validates :name, uniqueness: true
end
