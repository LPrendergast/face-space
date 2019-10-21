user1 = User.create(username: "Kane")

page1 = Page.create(title: "Kane's page.", content: "Hello, I am Kane. Hear me roar!", user_id: user1.id)

post1 = Post.create(title: "I am great.", content: "Wasabi is my favourite food.", user_id:user1.id, page_id: page1.id)
