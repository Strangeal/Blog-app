class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  before_save :likes_counter
end

def likes_counter
  post.update(likes_counter: post.likes.all.length)
end
