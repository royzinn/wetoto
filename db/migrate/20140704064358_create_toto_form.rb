class CreateTotoForm < ActiveRecord::Migration
  def change
    create_table :toto_forms do |t|
      t.integer :round
      t.datetime :round_date
      t.timestamps
    end
  end
end
