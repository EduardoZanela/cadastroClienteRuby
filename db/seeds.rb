# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Systemuser.create(email: 'eduardogzanela@gmail.com', password: '123456')
Systemuser.create(email: 'felipe', password: '123456')
Systemuser.create(email: 'admin', password: 'admin')

100.times do |i|

  User.create(name: Faker::Name.name, city: Faker::Address.city,
              province: Faker::Address.state, country: Faker::Address.country, birth_date: Faker::Date.birthday(18, 65),
              civil: Faker::Demographic.marital_status, sex: Faker::Demographic.sex, profession: Faker::Company.profession)

end