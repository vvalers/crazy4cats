class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  validates :body, presence: true
  validates :post, presence: true
end
