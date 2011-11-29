# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Condition.destroy_all
conditions = Condition.create([{shape: 'Excellent'}, {shape: 'Very Good'}, {shape: 'Good'}, {shape: 'Fair'}, {shape: 'Poor'}])

Category.destroy_all
categories = Category.create([{title: 'Furniture'}, {title: 'Electronics'}, {title: 'Kitchen Goods'}, {title: 'Clothing'}, {title: 'Sporting Equipment'}, {title: 'Books'}, {title: 'Accessories'}])