class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def like
    increment!(:likes_count)
  end

  def dislike
    increment!(:dislikes_count)
  end

end
