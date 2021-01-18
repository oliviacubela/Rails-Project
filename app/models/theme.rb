class Theme < ApplicationRecord
  has_many :dreams

  validates :name, presence: true
  validates :description, presence: true
end
