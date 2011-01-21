class AddTeamsToSuggestions < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :team1, :string
    add_column :suggestions, :team2, :string
    remove_column :suggestions, :title
  end

  def self.down
    remove_column :suggestions, :team1
    remove_column :suggestions, :team2
    add_column :suggestions, :title, :string
  end
end
