# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating subjects...'

english = Subject.new(name: "English")
english.save!

mathematics = Subject.new(name: "Mathematics")
mathematics.save!

physics = Subject.new(name: "Physics")
physics.save!

biology = Subject.new(name: "Biology")
biology.save!

finance = Subject.new(name: "Finance")
finance.save!

accounting = Subject.new(name: "Accounting")
accounting.save!

puts 'Finished!'

puts 'Creating Languages...'

english = Language.new(name: "English")
english.save!

italian = Language.new(name: "Italian")
italian.save!

french = Language.new(name: "French")
french.save!

german = Language.new(name: "German")
german.save!

spanish = Language.new(name: "Spanish")
spanish.save!

danish = Language.new(name: "Danish")
danish.save!

puts 'Finished!'
