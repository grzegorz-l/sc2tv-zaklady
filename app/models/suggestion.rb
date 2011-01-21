class Suggestion < ActiveRecord::Base
  validates_presence_of :team1, :team2, :date, :link
end
