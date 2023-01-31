require 'rails_helper'

RSpec.describe 'Posts show view', type: :system do
  describe 'Show page' do
    before(:each) do
      # rubocop:disable Layout/LineLength
      @first_user = User.create(name: 'Tom', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg', bio: 'Mexico.')
      @second_user = User.create(name: 'Mike', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721410/Meta%20tags/photo_2022-11-19_16.50.29_y1mzds.jpg', bio: 'Algeria.')
      # rubocop:enable Layout/LineLength
      @first_post = Post.create(author: @first_user, title: 'Hello, \'m Tom from Mexico and am a Teacher',
                                text: 'This is my first post')
      @second_post = Post.create(author: @second_user, title: "Hello, I'm Lilly from Poland and am a Student",
                                 text: 'This is my second post')

      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Awesome post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Great post Tom')

      @user = @first_user
      visit user_post_path(@first_user.id, @first_post)
    end

    it 'Can see a post\'s title' do
      expect(page).to have_content(@first_post.title.to_s)
    end

    it 'Can see who wrote the post' do
      expect(page).to have_content(@first_user.name.to_s)
    end

    it 'Can see how many comments it has' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    it 'Can see how many comments it has' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    it 'Can see the post body' do
      expect(page).to have_content(@first_post.text)
    end

    it 'Can see the username of each commentor' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.author.name.to_s)
      end
    end

    it 'Can see the comment each commentor left' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.text.to_s)
      end
    end
  end
end
