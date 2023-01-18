require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @first_post = Post.create(author: @first_user, title: 'Hello, I’m Tom from Mexico', text: 'This is my first post')
    @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
    Like.create(author: @first_user, post: @first_post)
  end

  it 'first_comment should have an author set to first_user' do
    expect(@first_comment.author).to eq @first_user
  end

  it 'likes_counter should == 0' do
    expect(@first_post.likes_counter).to eq 0
  end
end
