class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image 

  validates :caption, :image, presence: true
end
