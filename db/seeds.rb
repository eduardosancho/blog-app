# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  User.destroy_all

  first_user = User.new(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&
    auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Mexico.', email: 'first@email.com', :password => '123456', :password_confirmation => '123456')
  first_user.skip_confirmation!
  first_user.save!
  second_user = User.new(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1628088353808-a2ae5adf88f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&
    auto=format&fit=crop&w=870&q=80', bio: 'Teacher from Poland.', email: 'second@email.com', :password => '123456', :password_confirmation => '123456')
  second_user.skip_confirmation!
  second_user.save!

  first_post = Post.create(author_id: first_user.id, title: 'Hello1', text: 'This is my first post')
  second_post = Post.create(author_id: first_user.id, title: 'Hello2', text: 'This is my second post')
  third_post = Post.create(author_id: first_user.id, title: 'Hello3', text: 'This is my third post')
  fourth_post = Post.create(author_id: first_user.id, title: 'Hello4', text: 'This is my fourth post')

  Comment.create(post_id: fourth_post.id, author_id: second_user.id, text: 'Hi Tom!')
  Comment.create(post_id: fourth_post.id, author_id: second_user.id, text: 'How are you Tom?')
  Comment.create(post_id: fourth_post.id, author_id: second_user.id, text: 'Bye Tom!')

  Comment.create(post_id: fourth_post.id, author_id: first_user.id, text: 'Hi Lilly!')
  Comment.create(post_id: fourth_post.id, author_id: first_user.id, text: 'How are you Lilly?')
  Comment.create(post_id: fourth_post.id, author_id: first_user.id, text: 'Bye Lilly!')

  Like.create(post_id: fourth_post.id, author_id: first_user.id) 
  Like.create(post_id: fourth_post.id, author_id: second_user.id) 