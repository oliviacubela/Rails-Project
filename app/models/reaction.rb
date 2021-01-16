class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  # validates :name, presence: true
end
