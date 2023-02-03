# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.all.each do |user|
#   user.update(password: 'secretpassword@123')
# end


first_user = User.create(name: "Tom", photo: "https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg", bio: "Teacher from Mexico.", email: "tom@apple.com",  password: "mysecret@12", password_confirmation: "mysecret@12", role: "admin", jti: "sdhfsh64y4" )
second_user = User.create(name: 'Lilly', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg', bio: 'Student from Poland.', email: "lilly@apple.com",  password: "mysecret@12", password_confirmation: "mysecret@12", role: "user", jti: "zdvs674953jhc3")
third_user = User.create(name: 'Mike', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721410/Meta%20tags/photo_2022-11-19_16.50.29_y1mzds.jpg', bio: 'Developer from Algeria.', email: "mike@apple.com",  password: "mysecret@12", password_confirmation: "mysecret@12", role: "user", jti: "ree524336ew")
fourth_user = User.create(name: 'kevin', photo: 'https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg', bio: 'Writer from Switzerland.', email: "kevin@apple.com",  password: "mysecret@12", password_confirmation: "mysecret@12", role: "user", jti: "65hsgwtwiwuqoqp76")



first_post = Post.create(author_id: 1, title: "Hello, I'm Tom from Mexico and am a Teacher", text: "This is my first post")
second_post = Post.create(author_id: 2, title: "Hello, I'm Lilly from Poland and am a Student", text: "This is my second post")
third_post = Post.create(author_id: 3, title: "Hello, I'm Mike from Algeria and am a Developer", text: "This is my third post")
fourth_post = Post.create(author_id: 4, title: "Hello, I'm Kevin from Switzerland and am a Writer", text: "This is my fourth post")


Comment.create(post: first_post, author_id: 1, text: 'Amazing post')
Comment.create(post: first_post, author_id: 2, text: 'Awesome post')
Comment.create(post: first_post, author_id: 1, text: 'Great post')
Comment.create(post: first_post, author_id: 2, text: 'I approciate your hard work')
Comment.create(post: first_post, author_id: 1, text: 'Hi, keep up the great work')
Comment.create(post: first_post, author_id: 2, text: 'Hello, When are you posting about.......')

Comment.create(post: second_post, author_id: 1, text: 'Amazing post Lilly')
Comment.create(post: second_post, author_id: 2, text: 'Awesome post Lilly')
Comment.create(post: second_post, author_id: 1, text: 'Great post Lilly')
Comment.create(post: second_post, author_id: 2, text: 'Lilly I approciate your hard work')
Comment.create(post: second_post, author_id: 1, text: 'Hi Lilly, keep up the great work')
Comment.create(post: second_post, author_id: 2, text: 'Hello Lilly, When are you posting about.......')


Comment.create(post: fourth_post, author_id: 3, text: 'Amazing post Kevin')
Comment.create(post: fourth_post, author_id: 4, text: 'Awesome post Kevin')
Comment.create(post: fourth_post, author_id: 3, text: 'Great post Kevin')
Comment.create(post: fourth_post, author_id: 4, text: 'Kevin I approciate your hard work')
Comment.create(post: fourth_post, author_id: 3, text: 'Hi Kevin, keep up the great work')
Comment.create(post: fourth_post, author_id: 4, text: 'Hello Kevin, When are you posting about.......')


Comment.create(post: third_post, author_id: 3, text: 'Amazing post Mike')
Comment.create(post: third_post, author_id: 4, text: 'Awesome post Mike')
Comment.create(post: third_post, author_id: 3, text: 'Great post Mike')
Comment.create(post: third_post, author_id: 4, text: 'Mike I approciate your hard work')
Comment.create(post: third_post, author_id: 3, text: 'Hi Mike, keep up the great work')
Comment.create(post: third_post, author_id: 4, text: 'Hello Mike, When are you posting about.......')


Like.create(post: first_post, author_id: 2)
Like.create(post: first_post, author_id: 2)
Like.create(post: second_post, author_id: 2)
Like.create(post: second_post, author_id: 2)
Like.create(post: third_post, author_id: 2)
Like.create(post: third_post, author_id: 2)
Like.create(post: fourth_post, author_id: 2)
Like.create(post: fourth_post, author_id: 2)