# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.create!(name: "sugar", sex: "F", birth_date: "2007/11/10", color: "brown", description: "cute")
Cat.create!(name: "hobbes", sex: "M", birth_date: "2010/01/10", color: "orange", description: "playful")
Cat.create!(name: "rolly-polly", sex: "M", birth_date: "2007/04/10", color: "white", description: "chubbs")


CatRentalRequest.create!(cat_id: 1, start_date: Date.new(1978,2,2),end_date: Date.new(1978,2,4))
