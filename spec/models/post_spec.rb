require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @first_post = Post.create(author: @first_user, title: 'Hello, I’m Tom from Mexico', text: 'This is my first post')
  end

  context 'testing validations' do
    it 'title should be present' do
      @first_post.title = nil
      expect(@first_post).to_not be_valid
    end

    it 'title should be "Hello, I’m Tom from Mexico"' do
      expect(@first_post.title).to eql 'Hello, I’m Tom from Mexico'
    end

    it 'comments_counter should not be strings' do
      @first_post.likes_counter = 'a'
      expect(@first_post).to_not be_valid
    end

    it 'likes_counter should not be strings' do
      @first_post.comments_counter = 'a'
      expect(@first_post).to_not be_valid
    end

    it 'most_recent_comments should return the 5 most recent posts' do
      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')

      expect(@first_post.most_recent_comments.length).to eq 5
    end
  end
end
