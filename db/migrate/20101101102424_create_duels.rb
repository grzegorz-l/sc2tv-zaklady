class CreateDuels < ActiveRecord::Migration
  def self.up
    create_table :duels do |t|
      t.string :team1
      t.string :team2
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :duels
  end
end
