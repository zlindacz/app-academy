# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Duck")
User.create!(name: "Linda")
User.create!(name: "Colin")

Poll.create!(title: "favorite cakes", author_id: 2)
Poll.create!(title: "favorite animal", author_id: 3)

Question.create!(question: "what color?", poll_id: 1)
Question.create!(question: "what flavor", poll_id: 1)

Question.create!(question: "is it a cat?", poll_id: 2)

AnswerChoice.create!(answer_choice: "red", question_id: 1)
AnswerChoice.create!(answer_choice: "white", question_id: 1)

AnswerChoice.create!(answer_choice: "yes", question_id: 3)
AnswerChoice.create!(answer_choice: "super yes", question_id: 3)
AnswerChoice.create!(answer_choice: "cheese", question_id: 2)

Response.create!(respondent_id: 1, answer_choice_id: 5)
Response.create!(respondent_id: 3, answer_choice_id: 5)
Response.create!(respondent_id: 1, answer_choice_id: 4)
