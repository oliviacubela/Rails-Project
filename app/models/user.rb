class User < ApplicationRecord
  has_many :reactions
  has_many :dream_reactions, through: :reactions, source: :dream
  has_many :dreams
end


#ICS - 25