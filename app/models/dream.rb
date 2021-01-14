class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :reactions 
  has_many :users, through: :reactions
end
