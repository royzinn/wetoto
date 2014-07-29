class UserGuess < ActiveRecord::Base
  belongs_to :user
  belongs_to :toto_form

  after_create :update_predicted_form

  def update_predicted_form
    self.toto_form.matches.each_with_index do |m, i|
      require 'pry'; binding.pry
      case self.results[i]
        when "1"
          m.home_team_votes ? m.home_team_votes += 1 : m.home_team_votes = 1
        when "2"
          m.visitor_team_votes ? m.visitor_team_votes += 1 : m.visitor_team_votes = 1
        when "0"
          m.draw_votes ? m.draw_votes += 1 : m.draw_votes = 1
        end
        m.save!
      end
    end
end
