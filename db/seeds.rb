user1 = User.create(username: "Kane", password: "123", bio: "lknsd", age: 7, country: "Australia", city: "Syndey", phone_number: "111-111-111-111", hobbies: "Climbing, Being australian" )
user2 = User.create(username: "Tim", password: "123")
user3 = User.create(username: "Luke", password: "123")
user4 = User.create(username: "Michael", password: "123")
user5 = User.create(username: "Marco", password: "123")



page1 = Page.create(title: "Kane's page.", content: "Hello, I am Kane. Hear me roar!", user_id: user1.id)
page2 = Page.create(title: "Tim's page.", content: "Hello.", user_id: user1.id)
page3 = Page.create(title: "Luke's page.", content: "I'm a man of few words.", user_id: user1.id)
page4 = Page.create(title: "Michael's page.", content: "Post-Lunch smoke break.", user_id: user1.id)
page5 = Page.create(title: "Marco's page.", content: "I got a haircut at the weekend.", user_id: user1.id)

post1 = Post.create(title: "I am great.", content: "Wasabi is my favourite food.", user_id:user1.id, page_id: page1.id)
post2 = Post.create(title: "I am not great.", content: "I would like to destroy the moon.", user_id:user1.id, page_id: page2.id)
post3 = Post.create(title: "I am not not great.", content: "Salt and vinegar is the god tier crisp.", user_id:user1.id, page_id: page2.id)
post4 = Post.create(title: "I am not not not great.", content: "Cheese and onion is great and all but prawn cocktail tickles my fancy.", user_id:user2.id, page_id: page3.id)
post5 = Post.create(title: "I am not not not not great.", content: "YUP", user_id:user3.id, page_id: page4.id)
post6 = Post.create(title: "I am not not not not not great.", content: "I can never remember how to spell separate.", user_id:user4.id, page_id: page5.id)
post7 = Post.create(title: "I am not not not not not not great.", content: "B-e-aaaaaaayutiful", user_id:user5.id, page_id: page5.id)
