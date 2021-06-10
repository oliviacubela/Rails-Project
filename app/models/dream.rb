class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :reactions 
  has_many :users, through: :reactions

  validates :title, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :theme, reject_if: proc { |attributes| attributes['name'].blank? }

  def self.search(params)
    where("LOWER(title) LIKE :term OR LOWER(content) LIKE :term", term: "%#{params}%")
  end
  #why do we add 'params' in SQL Query?
  #It prevents someone from injecting code that will delete entire database.. we are specifically asking to see if a title euqalis that name
  #instead of sneaking in a closing quote that impacts the sql queary that can delete db

  #line 13 - use symbol term instead of '?' to keep DRY and send hash params

  # def self.alpha 
  #   order(:title)
  # end

  # def theme_attributes=(attributes)
  #   # binding.pry
  #   theme = Theme.find_or_create_by(attributes) if !attributes['name'].empty?
  # end
  #can i change this up to serve as a validation? where if the attributes are empty you create it, or if they match by name then you send error message with "theme name already exists"
  #has to be a simpler way... uniqueness validation didnt work but I might've done scope wrong

end
