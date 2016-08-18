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

bike = Offer.new(
 user_id: 1,
 name: "bike",
 price: 300,
 description: "rode fiets",
 latitude: 50.846973,
 longitude: 4.358415,
 sold: nil,
 category_id: Category.where(name: 'Vehicules').first.id,
 city: "Brussels",
)
bike.save!


skirt = Offer.new(
 user_id: 1,
 name: "skirt",
 price: 25,
 description: "donkerblauwe rok met gele stippen",
 sold: nil,
 category_id: Category.where(name:'Clothes').first.id,
 city: "Genk",
)
skirt.save!

sandwich = Offer.new(
 user_id: 1,
 name: "sandwich",
 price: 4,
 description: "cheese sandwich with lettuce and tomato",
 sold: nil,
 category_id: Category.where(name:'Entertainment').first.id,
 city: "Brussels",
)
sandwich.save!

vlag = Offer.new(
 user_id: 1,
 name: "vlag",
 price: 50,
 description: "belgische driekkleur",
 sold: nil,
 category_id: Category.where(name:'Accessories').first.id,
 city: "Brussels",
)
vlag.save!
