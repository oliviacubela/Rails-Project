class Theme < ApplicationRecord
  has_many :dreams

  validates :name, presence: true
  validates :description, presence: true
  
  validates_uniqueness_of :name

  #the validates_uniqueness_of works for new themes and preventing duplicates, but not for collection_select
  #do i need to add scope? another method?
  #validates :name, uniqueness: { scope: :theme, message: "already exists - please select from drop-down" } 
end


