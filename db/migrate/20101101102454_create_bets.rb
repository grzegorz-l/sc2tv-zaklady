class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.string :winner
      t.integer :gold
      t.timestamps
    end
  end

  def self.down
    drop_table :bets
  end
end
