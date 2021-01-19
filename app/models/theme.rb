class Theme < ApplicationRecord
  has_many :dreams

  validates :name, presence: true
  validates :description, presence: true
  
  #validates :name, uniqueness: { scope: :theme, message: "already exists - please select from drop-down" } 
end
