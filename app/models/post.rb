class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 5, maximum: 200 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author_name, presence: true, unless: :anonymous?
  
  scope :recent, -> { order(created_at: :desc) }
  scope :anonymous, -> { where(anonymous: true) }
  scope :named, -> { where(anonymous: false) }
end
