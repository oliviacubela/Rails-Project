class User < ApplicationRecord
  has_many :reactions
  has_many :dream_reactions, through: :reactions, source: :dream
  has_many :dreams

  validates :username, uniqueness: true, presence: true

  has_secure_password

end


#ICS - 25