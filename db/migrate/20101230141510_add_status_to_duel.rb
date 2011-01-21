class AddStatusToDuel < ActiveRecord::Migration
  def self.up
    add_column :duels, :status, :string, :default => "Nierozpoczety"
    add_column :duels, :event, :string
  end

  def self.down
    remove_column :duels, :status
    remove_column :duels, :event
  end
end
