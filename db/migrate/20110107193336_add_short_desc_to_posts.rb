class AddShortDescToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :short_desc, :text
  end

  def self.down
    remove_column :posts, :short_desc
  end
end
