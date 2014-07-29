class AddStatsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :stats, :hstore
  end
end
