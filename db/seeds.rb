# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all


cat = Category.new(name: 'Clothes')
cat.save
cat = Category.new(name: 'Furnitues')
cat.save
cat = Category.new(name: 'Toys')
cat.save
cat = Category.new(name: 'Vehicules')
cat.save
cat = Category.new(name: 'Entertainment')
cat.save
cat = Category.new(name: 'Electronics')
cat.save
cat = Category.new(name: 'Jewelry')
cat.save
cat = Category.new(name: 'Accessories')
cat.save



