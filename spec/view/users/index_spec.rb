require 'rails_helper'

RSpec.describe "Users index view", type: :system do
  describe "Index page" do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg', bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Mike', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721410/Meta%20tags/photo_2022-11-19_16.50.29_y1mzds.jpg', bio: 'Teacher from Algeria.')

      @first_post = Post.create(author: @first_user, title: 'Hello, I’m Tom from Mexico and am a Teacher',  text: 'This is my first post')
      @second_post = Post.create(author: @second_user, title: 'Hello, I’m Lilly from Poland and am a Student', text: 'This is my second post')
      
      @user = User.all
    end

    it 'Can see the user\'s of each user' do
      visit users_path
      @user.each do |person|
        expect(page).to have_content("#{person.name}")
      end
    end

    it 'Can see profile picture of each user' do
      visit users_path
      @user.each do |person|
        expect(page).to have_css("img[src*='#{person.photo}']")
      end
    end

    it 'Can see the number of posts by each user' do
      visit users_path
      @user.each do |person|
        expect(page).to have_content("Number of posts: #{person.posts_counter}")
      end
    end

    it 'Can click on a user, to be redirected to user\'s show page' do
      visit users_path
      expect("#{page.current_url}/users/#{@first_user.id}").to match user_path(@first_user.id)
    end
  end
end