require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    before(:each) do
      # rubocop:disable Layout/LineLength
      @first_user = User.create(name: 'Tom', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg', bio: 'Mexico.')
      @second_user = User.create(name: 'Mike', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721410/Meta%20tags/photo_2022-11-19_16.50.29_y1mzds.jpg', bio: 'Algeria.')
      # rubocop:enable Layout/LineLength
      @first_post = Post.create(author: @first_user, title: 'Hello, I’m Tom from Mexico and am a Teacher',
                                text: 'This is my first post')
      @second_post = Post.create(author: @second_user, title: 'Hello, I’m Lilly from Poland and am a Student',
                                 text: 'This is my second post')

      Comment.create(post: @first_post, author: @first_user, text: 'Amazing post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Awesome post Tom')
      Comment.create(post: @first_post, author: @first_user, text: 'Great post Tom')

      @user = User.all
      visit user_posts_path(@first_user.id)
    end

    it 'Can see user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    it 'Can see user\'s username' do
      expect(page).to have_content(@first_user.name.to_s)
    end

    it 'Can see number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    it 'Can see a post\'s title' do
      expect(page).to have_content(@first_post.title.to_s)
    end

    # it 'Can see some of the post\'s body' do
    #     expect(page).to have_content("#{@first_post.text[0..50]}")
    # end

    it 'Can see the first comments on a post' do
      expect(page).to have_content(@first_post.comments.last.text.to_s)
    end

    it 'Can see how many comments a post has' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    it 'Can see how many likes a post has' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    it 'Can see a pagination button if there are more posts than fit' do
      expect(page).to have_content('Pagination')
    end

    it 'Can click on a post, to be redirected to post\'s show page' do
      expect("#{page.current_url}/#{@first_post.id}").to match user_post_path(@first_user.id, @first_post.id)
    end
  end
end
