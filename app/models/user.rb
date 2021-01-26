class User < ApplicationRecord
  has_many :reactions
  has_many :dream_reactions, through: :reactions, source: :dream
  has_many :dreams

  validates :username, uniqueness: true, presence: true

  has_secure_password

  #username instead of email bc we want to avoid different people creating same usernames and potentially logging in to other person's acct, so we set the username to be the email...thought this was avoided w/ uniqueness validation????
  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex 
    end
  end

end

#moved the create_by_google_omniauth method out of sessionscontroller to model bc in bigger apps or if our user has a lot more properties, it performs better in user model.


#ICS - 25