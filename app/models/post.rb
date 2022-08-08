class Post < ApplicationRecord
  belongs_to :author
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
