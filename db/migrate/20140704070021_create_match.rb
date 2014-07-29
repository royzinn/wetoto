class CreateMatch < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :result
      t.datetime :date_played
      t.references :home_team, index: true
      t.references :visitor_team, index: true
      t.references :toto_form, index: true
    end
  end
end
