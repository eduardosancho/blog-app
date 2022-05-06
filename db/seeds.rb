# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxM
    jA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Mexico.', posts_counter: 0)
  second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1628088353808-a2ae5adf88f2?ixlib=rb-1.2.1&ixid=
    MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Teacher from Poland.', posts_counter: 0)

  first_post = Post.create(author: first_user, title: 'Hello1', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
  second_post = Post.create(author: first_user, title: 'Hello2', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
  third_post = Post.create(author: first_user, title: 'Hello3', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
  fourth_post = Post.create(author: first_user, title: 'Hello4', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
  Comment.create(post: first_post, author: second_user, text: 'How are you Tom?')
  Comment.create(post: first_post, author: second_user, text: 'Bye Tom!')

  Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!')
  Comment.create(post: first_post, author: first_user, text: 'How are you Lilly?')
  Comment.create(post: first_post, author: first_user, text: 'Bye Lilly!')

  Like.create(post: first_post, author: first_user) 
  Like.create(post: first_post, author: second_user) 