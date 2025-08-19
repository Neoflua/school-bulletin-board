class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :color, presence: true
end
