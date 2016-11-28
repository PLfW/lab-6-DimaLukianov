# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by(email: 'admin@sc.com') do |admin|
  admin.password = '123456'
  puts 'Admin successfully created!'
  puts 'email: admin@sc.com'
  puts 'password: 123456'
end
