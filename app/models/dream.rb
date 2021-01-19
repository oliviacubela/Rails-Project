class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :reactions 
  has_many :users, through: :reactions

  accepts_nested_attributes_for :theme

  validates :title, presence: true
  validates :content, presence: true

  def self.alpha 
    order(title: :asc)
  end

  def theme_attributes=(attributes)
    # binding.pry
    theme = Theme.find_or_create_by(attributes) if !attributes['name'].empty?
  end
  #can i change this up to serve as a validation? where if the attributes are empty you create it, or if they match by name then you send error message with "theme name already exists"
  #has to be a simpler way... uniqueness validation didnt work but I might've done scope wrong

end
