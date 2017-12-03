# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


counter = 0
first_name = ["Alex", "Niko", "Max", "Felix", "Paul", "Lena", "Clara", "Leonie", "Franziska", "Maria"].shuffle
last_name = ["Muster", "Man", "Frau", "Müller", "Meier", "Schneider", "Fischer", "Klein", "Bauer", "Schwarz"].shuffle

p "Create User"
10.times do
  u = User.create(
    email: first_name[counter] + "." + last_name[counter] + "@gmx.de",
    first_name: first_name[counter],
    last_name: last_name[counter],
    password: "123456"
  )

  counter += 1
end
p "Users created"

p "Add chats"
20.times do
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  chat_n = arr.sample
  arr.delete(chat_n)
  chat_p = arr.sample

  c = Chat.create(
    name: User.find(chat_p).first_name,
    user_one: User.find(chat_n),
    user_two: User.find(chat_p)
  )
end
p "Done"
