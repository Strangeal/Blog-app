require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @first_post = Post.create(author: @first_user, title: 'Hello, I’m Tom from Mexico', text: 'This is my first post')
    Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
  end

  it 'method test' do
    expect(@first_post.comments_counter).to eq 0
  end
end
