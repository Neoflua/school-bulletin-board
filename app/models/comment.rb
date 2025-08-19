class Comment < ApplicationRecord
  belongs_to :post
  
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :author_name, presence: true, unless: :anonymous?
  
  scope :recent, -> { order(created_at: :desc) }
end
