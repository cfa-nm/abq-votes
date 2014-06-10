# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Voter.create! [{
  name: 'Ben Cates',
  email: 'ben.cates@example.com',
  address: '3305 Calle Cuervo',
  zip: 87114,
  birthday: '1984-01-10'
}]
