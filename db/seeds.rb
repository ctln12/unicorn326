require 'faker'

puts 'Destroying taught lessons...'
TaughtLesson.destroy_all

puts 'Destroying subjects...'
Subject.destroy_all

puts 'Destroying spoken languages...'
SpokenLanguage.destroy_all

puts 'Destroying languages...'
Language.destroy_all

puts 'Destroying students'
Student.destroy_all

puts 'Destroying tutors'
Tutor.destroy_all
puts '-----------------------------'

puts 'Creating subjects...'

english = Subject.new(name: "English")
english.save

mathematics = Subject.new(name: "Mathematics")
mathematics.save

physics = Subject.new(name: "Physics")
physics.save

biology = Subject.new(name: "Biology")
biology.save

finance = Subject.new(name: "Finance")
finance.save

accounting = Subject.new(name: "Accounting")
accounting.save

chemistry = Subject.new(name: "Chemistry")
chemistry.save

french = Subject.new(name: "French")
french.save

philosophy = Subject.new(name: "Philosophy")
philosophy.save

statistics = Subject.new(name: "Statistics")
statistics.save

chinese = Subject.new(name: "Chinese")
chinese.save

communication = Subject.new(name: "Communication")
communication.save

german = Subject.new(name: "German")
german.save

japanese = Subject.new(name: "Japanese")
japanese.save

korean = Subject.new(name: "Korean")
korean.save

latin = Subject.new(name: "Latin")
latin.save

russian = Subject.new(name: "Russian")
russian.save

spanish = Subject.new(name: "Spanish")
spanish.save

science = Subject.new(name: "Science")
science.save

astronomy = Subject.new(name: "Astronomy")
astronomy.save

human_biology = Subject.new(name: "Human Biology")
human_biology.save

graphics = Subject.new(name: "Graphics")
graphics.save

puts 'Finished!'
puts '-----------------------------'

puts 'Creating Languages...'

english = Language.new(name: "English")
english.save

italian = Language.new(name: "Italian")
italian.save

french = Language.new(name: "French")
french.save

german = Language.new(name: "German")
german.save

spanish = Language.new(name: "Spanish")
spanish.save

danish = Language.new(name: "Danish")
danish.save

russian = Language.new(name: "Russian")
russian.save

korean = Language.new(name: "Korean")
korean.save

japanese = Language.new(name: "Japanese")
japanese.save

dutch = Language.new(name: "Dutch")
dutch.save

swedish = Language.new(name: "Swedish")
swedish.save

portugese = Language.new(name: "Portugese")
portugese.save

finnish = Language.new(name: "Finnish")
finnish.save

indonesian = Language.new(name: "Indonesian")
indonesian.save

chinese = Language.new(name: "Chinese")
chinese.save

puts 'Finished!'
puts '-----------------------------'

puts 'Creating Students...'
alice = Student.new(first_name: 'Alice', last_name: 'Needham', country: 'SE', date_of_birth: '2000-05-10', email: 'alice.needham@student.com', password: '123456')
alice.save
bob = Student.new(first_name: 'Bob', last_name: 'Hutchings', country: 'GB', date_of_birth: '1995-10-08', email: 'bob.hutchingsg@student.com', password: '123456')
bob.save
puts 'Finished'
puts '-----------------------------'

puts 'Creating Tutors...'
pierre = Tutor.new(first_name: 'Pierre', last_name: 'Martin', date_of_birth: '1967-06-20', country: 'FR', phone_number: '33671283384', currency: 'EUR', price: 25, email: 'pierre.martin@tutor.com', password: '123456')
pierre.save
david = Tutor.new(first_name: 'David', last_name: 'Lawson', date_of_birth: '1951-01-24', country: 'GB', phone_number: '44214235689', currency: 'GBP', price: 30, email: 'david.lawson@tutor.com', password: '123456')
david.save
charles = Tutor.new(first_name: 'Charles', last_name: 'Davis', date_of_birth: '1991-04-30', country: 'US', phone_number: '12145096897', currency: 'USD', price: 25, email: 'charles.davis@tutor.com', password: '123456')
charles.save
john = Tutor.new(first_name: 'John', last_name: 'Kendall', date_of_birth: '1972-12-17', country: 'CA', phone_number: '12267741234', currency: 'CAD', price: 20, email: 'john.kendall@tutor.com', password: '123456')
john.save
georges = Tutor.new(first_name: 'Georges', last_name: 'Till', date_of_birth: '1980-02-03', country: 'CH', phone_number: '41786272034', currency: 'CHF', price: 30, email: 'george.till@tutor.com', password: '123456')
georges.save
tut1 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut1.save
tut2 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut2.save
tut3 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut3.save
tut4 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut4.save
tut5 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut5.save
tut6 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut6.save
tut7 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut7.save
tut8 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut8.save
tut9 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut9.save
tut10 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut10.save
tut11 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut11.save
tut12 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut12.save
tut13 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut13.save
tut14 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut14.save
tut15 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut15.save
tut16 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut16.save
tut17 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut17.save
tut18 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut18.save
tut19 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut19.save
tut20 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut20.save
tut21= Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut21.save
tut22 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut22.save
tut23 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut23.save
tut24 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut24.save
tut25 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut25.save
tut26 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut26.save
tut27 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut27.save
tut28 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut28.save
tut29 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut29.save
tut30 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut30.save
tut31 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut31.save
tut32 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut32.save
tut33 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut33.save
tut34 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut34.save
tut35 = Tutor.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65), country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample, phone_number: Faker::PhoneNumber.phone_number, currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample, price: rand(10...30), email: Faker::Internet.email, password: '123456')
tut35.save

puts 'Finished!'
puts '-----------------------------'

puts 'Creating Taught Lessons...'
taughtlesson1 = TaughtLesson.new(subject_id: mathematics.id, tutor_id: pierre.id)
taughtlesson1.save
taughtlesson2 = TaughtLesson.new(subject_id: physics.id, tutor_id: pierre.id)
taughtlesson2.save
taughtlesson3 = TaughtLesson.new(subject_id: chemistry.id, tutor_id: pierre.id)
taughtlesson3.save
taughtlesson4 = TaughtLesson.new(subject_id: mathematics.id, tutor_id: david.id)
taughtlesson4.save
taughtlesson5 = TaughtLesson.new(subject_id: biology.id, tutor_id: david.id)
taughtlesson5.save
taughtlesson6 = TaughtLesson.new(subject_id: mathematics.id, tutor_id: charles.id)
taughtlesson6.save
taughtlesson7 = TaughtLesson.new(subject_id: philosophy.id, tutor_id: charles.id)
taughtlesson7.save
taughtlesson8 = TaughtLesson.new(subject_id: french.id, tutor_id: charles.id)
taughtlesson8.save
taughtlesson9 = TaughtLesson.new(subject_id: mathematics.id, tutor_id: john.id)
taughtlesson9.save
taughtlesson10 = TaughtLesson.new(subject_id: statistics.id, tutor_id: john.id)
taughtlesson10.save
taughtlesson11 = TaughtLesson.new(subject_id: mathematics.id, tutor_id: georges.id)
taughtlesson11.save
taughtlesson11 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson11.save
taughtlesson12 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson12.save
taughtlesson13 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson13.save
taughtlesson14 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson14.save
taughtlesson15 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson15.save
taughtlesson16 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson16.save
taughtlesson17 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson17.save
taughtlesson18 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson18.save
taughtlesson19 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson19.save
taughtlesson20 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson20.save
taughtlesson21 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson21.save
taughtlesson22 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson22.save
taughtlesson23 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson23.save
taughtlesson24 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson24.save
taughtlesson25 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson25.save
taughtlesson26 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson26.save
taughtlesson27 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson27.save
taughtlesson28 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson28.save
taughtlesson29 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson29.save
taughtlesson30 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson30.save
taughtlesson31 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson31.save
taughtlesson32 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson32.save
taughtlesson33 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson33.save
taughtlesson34 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson34.save
taughtlesson35 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson35.save
taughtlesson36 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson36.save
taughtlesson37 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson37.save
taughtlesson38 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson38.save
taughtlesson39 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson39.save
taughtlesson40 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson40.save
taughtlesson41 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson41.save
taughtlesson42 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson42.save
taughtlesson43 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson43.save
taughtlesson44 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson44.save
taughtlesson45 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson45.save
taughtlesson46 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson46.save
taughtlesson47 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson47.save
taughtlesson48 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson48.save
taughtlesson49 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson49.save
taughtlesson50 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson50.save
taughtlesson51 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson51.save
taughtlesson52 = TaughtLesson.new(subject_id: Subject.all.sample.id, tutor_id: Tutor.all.sample.id)
taughtlesson52.save

puts 'Finished!'
puts '-----------------------------'

puts 'Creating Spoken Languages...'
spoken1 = SpokenLanguage.new(language_id: english.id, tutor_id: pierre.id)
spoken1.save
spoken2 = SpokenLanguage.new(language_id: french.id, tutor_id: pierre.id)
spoken2.save
spoken3 = SpokenLanguage.new(language_id: english.id, tutor_id: david.id)
spoken3.save
spoken4 = SpokenLanguage.new(language_id: french.id, tutor_id: david.id)
spoken4.save
spoken5 = SpokenLanguage.new(language_id: english.id, tutor_id: charles.id)
spoken5.save
spoken6 = SpokenLanguage.new(language_id: french.id, tutor_id: charles.id)
spoken6.save
spoken7 = SpokenLanguage.new(language_id: english.id, tutor_id: john.id)
spoken7.save
spoken8 = SpokenLanguage.new(language_id: french.id, tutor_id: john.id)
spoken8.save
spoken9 = SpokenLanguage.new(language_id: english.id, tutor_id: georges.id)
spoken9.save
spoken10 = SpokenLanguage.new(language_id: german.id, tutor_id: georges.id)
spoken10.save
spoken11 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken11.save
spoken12 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken12.save
spoken13 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken13.save
spoken14 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken14.save
spoken15 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken15.save
spoken16 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken16.save
spoken17 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken17.save
spoken18 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken18.save
spoken19 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken19.save
spoken20 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken20.save
spoken21 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken21.save
spoken22 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken22.save
spoken23 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken23.save
spoken24 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken24.save
spoken25 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken25.save
spoken26 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken26.save
spoken27 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken27.save
spoken28 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken28.save
spoken29 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken29.save
spoken30 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken30.save
spoken31 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken31.save
spoken32 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken32.save
spoken33 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken33.save
spoken34 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken34.save
spoken35 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken35.save
spoken36 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken36.save
spoken37 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken37.save
spoken38 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken38.save
spoken39 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken39.save
spoken40 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken40.save
spoken41 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken41.save
spoken42 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken42.save
spoken43 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken43.save
spoken44 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken44.save
spoken45 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken45.save
spoken46 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken46.save
spoken47 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken47.save
spoken48 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken48.save
spoken49 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken49.save
spoken50 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken50.save
spoken51 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken51.save
spoken52 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken52.save
spoken53 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken53.save
spoken54 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken54.save
spoken55 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken55.save
spoken56 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken56.save
spoken57 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken57.save
spoken58 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken58.save
spoken59 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken59.save
spoken60 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken60.save
spoken61 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken61.save
spoken62 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken62.save
spoken63 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken63.save
spoken64 = SpokenLanguage.new(language_id: Language.all.sample.id, tutor_id: Tutor.all.sample.id)
spoken64.save


puts 'Finished!'
puts '-----------------------------'


