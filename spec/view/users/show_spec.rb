RSpec.describe "User show view", type: :system do
  describe 'Show page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg', bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Mike', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721410/Meta%20tags/photo_2022-11-19_16.50.29_y1mzds.jpg', bio: 'Teacher from Algeria.')

      @first_post = Post.create(author: @first_user, title: 'Hello, I’m Tom from Mexico and am a Teacher',  text: 'This is my first post')
      @second_post = Post.create(author: @second_user, title: 'Hello, I’m Lilly from Poland and am a Student', text: 'This is my second post')

      @user = User.all
      visit user_path(@first_user.id)
    end

    it 'Can see user\'s profile picture' do
        expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    it 'Can see user\'s username' do
      expect(page).to have_content("#{@first_user.name}")
    end

    it 'Can see number of posts by user' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    it 'Can see the user\'s bio' do
      expect(page).to have_content("#{@first_user.bio}")
    end

    it 'Can see the user\'s last 3 posts' do
      @posts = @first_user.posts
      @posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'Can see a button that lets me view all of a user\'s posts' do
      expect(page).to have_content("See all posts")
    end

    it 'Can click on a user\'s, to be redirected to that post\'s show page' do
      click_link 'See all posts'
      click_link 'Post'
      expect("#{page.current_url}/#{@first_post.id}").to match user_post_path(@first_user, @first_post)
    end

    it 'Can click on a see all posts button, to be redirected to the user\'s post\'s index page' do
      click_link 'See all posts'
      expect("#{page.current_url}/posts").to match user_posts_path(@first_user.id)
    end
end
end