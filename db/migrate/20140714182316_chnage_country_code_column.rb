class ChnageCountryCodeColumn < ActiveRecord::Migration
  def change
    rename_column :teams, :country_code, :country
  end
end
