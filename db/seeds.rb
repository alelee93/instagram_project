
#password = "Password123!"

#admin = User.create(name: "Admin", email: "admin@instagram.com", password: "admin123!", password_confirmation: "admin123!", admin: true)
yoda = User.create(name: "Yoda", email: "yoda@instagram.com", password:"mypasswordthisis1!", password_confirmation: "mypasswordthisis1!", bio: "A master jedi I am." )
r2d2 = User.create(name: "R2-D2", email: "r2@instagram.com", password:"r2!", password_confirmation: "r2!", bio: "beep beep." )
ale = User.create(name: "Ale", email: "ale@instagram.com", password:"password123!", password_confirmation: "password123!", bio: "Learning how to code")

yoda_post = Post.create(user_id: yoda.id, content:"A picture of me you should see", image_path:"https://www.sideshow.com/storage/product-images/100407/yoda_star-wars_gallery_5c4c03e380ed0_th.jpg" )
yoda.posts << yoda_post

Interest.create(name: "math", description: "it's interesting")
Interest.create(name: "coding", description: "it's cool")
Interest.create(name: "art", description: "it's beautiful")
Interest.create(name: "history", description: "it's long")

yoda.follows(ale)
ale.follows(yoda)
r2d2.follows(yoda)

first_chat = ale.new_chat_room('first chat ever')
ale.add_user_to_chat(first_chat, ale)
ale.add_user_to_chat(first_chat, yoda)
ale.send_chat_message('Hi Yoda!', first_chat)
yoda.send_chat_message('Greetings Young Coder!', first_chat)

second_chat = r2d2.new_chat_room('Group chat')
r2d2.add_user_to_chat(second_chat, r2d2)
r2d2.add_user_to_chat(second_chat, yoda)
r2d2.send_chat_message('Beep Beep', second_chat)

#### Ignore, changed methods 

# yoda.message(ale, 'The force is with you young Ale.')
# ale.message(yoda, 'Yayyy.')
# r2d2.message(yoda, 'beep beep beeeep.')
# yoda.message(r2d2, 'English you must learn.')