class AddFinishedToDuels < ActiveRecord::Migration
  def self.up
    add_column :duels, :finished, :boolean, :default => false
  end

  def self.down
    remove_column :duels, :finished
  end
end
