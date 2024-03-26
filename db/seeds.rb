# db/seeds.rb
user1 = User.create(email: "user1@example.com", password: "password", password_confirmation: "password")
user2 = User.create(email: "user7@example.com", password: "password", password_confirmation: "password")

user1.tweets.create(content: "Hello, world!")
user2.tweets.create(content: "This is my first tweet!")

tweet1 = Tweet.first
tweet2 = Tweet.second

tweet1.comments.create(content: "Nice tweet!", user: user2)
tweet2.comments.create(content: "Thanks!",user:user1)