class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :reactions 
  has_many :users, through: :reactions

  accepts_nested_attributes_for :theme

  validates :title, presence: true
  validates :content, presence: true
  # validate :not_a_duplicate

  def theme_attributes=(attributes)
    theme = Theme.find_or_create_by(attributes) if !attributes['name'].empty?
  end

end
