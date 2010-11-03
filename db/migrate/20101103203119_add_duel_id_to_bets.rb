class AddDuelIdToBets < ActiveRecord::Migration
  def self.up
    add_column :bets, :duel_id, :integer
  end

  def self.down
    remove_column :bets, :duel_id
  end
end
