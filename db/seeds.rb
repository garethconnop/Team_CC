# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ForumCategory.create([{ name: 'Introductions' }, { name: 'Lifestyle' }, { name: 'Exercise' }, { name: 'Nutrition' }, { name: 'Mobility' }, { name: 'General' }])
VideoCategory.create([{ name: 'Push'}, { name: 'Pull'}, { name: 'Legs'}, { name: 'Core'}, { name: 'Mobility'}])