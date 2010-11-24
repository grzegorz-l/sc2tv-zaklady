class AddgoldTousers < ActiveRecord::Migration
  def self.up
    add_column :users, :gold, :integer, :default => 100
  end

  def self.down
    remove_column :users, :gold
  end
end
