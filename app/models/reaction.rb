class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  validates :name, presence: true
  validates :description, presence: true
end
