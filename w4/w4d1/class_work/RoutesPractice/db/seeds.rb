# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: "snehi")
User.create!(username: "linda")
User.create!(username: "sundae")

Contact.create!(name: "linda", email: "linda@email.com", user_id: 1)
Contact.create!(name: "sundae", email: "sundae@monday.com", user_id: 1)
Contact.create!(name: "snehi", email: "snehi@email.co.uk", user_id: 2)

ContactShare.create!(contact_id: 3, user_id: 2)
ContactShare.create!(contact_id: 1, user_id: 3)

Comment.create!(body: "I'm so hungry. Got any fries?", commentable_id: 2, commentable_type: 'user_id')
Comment.create!(body: "Lets go to McD's!", commentable_id: 1, commentable_type: 'contact_id')
Comment.create!(body: "Garlic fries!!!", commentable_id: 3, commentable_type: 'user_id')
