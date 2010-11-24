class AddWinnerToDuels < ActiveRecord::Migration
  def self.up
    add_column :duels, :winner, :string, :default => ""
  end

  def self.down
    remove_column :duels, :winner
  end
end
