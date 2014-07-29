class TotoForm < ActiveRecord::Base
  has_many :matches
  has_many :user_guesses
  has_many :users, through: :user_guesses
  accepts_nested_attributes_for :matches, reject_if: :all_blank, allow_destroy: true

  validates :round, numericality: true
end
