# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating subjects...'

english = Subjects.new(name: "English")
english.save!

mathematics = Subjects.new(name: "Mathematics")
mathematics.save!

physics = Subjects.new(name: "Physics")
physics.save!

biology = Subjects.new(name: "Biology")
biology.save!

finance = Subjects.new(name: "Finance")
finance.save!

accounting = Subjects.new(name: "Accounting")
accounting.save!

puts 'Finished!'

puts 'Creating Languages...'

english = Subjects.new(name: "English")
english.save!

italian = Subjects.new(name: "Italian")
italian.save!

french = Subjects.new(name: "French")
french.save!

german = Subjects.new(name: "German")
german.save!

spanish = Subjects.new(name: "Spanish")
spanish.save!

danish = Subjects.new(name: "Danish")
danish.save!

puts 'Finished!'
