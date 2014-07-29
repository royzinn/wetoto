class CreateUserGuess < ActiveRecord::Migration
  def change
    create_table :user_guesses do |t|
      t.references :toto_form, index: true
      t.references :user, index: true
      t.integer :results, array: true, default: []
    end
  end
end
