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

computer_science = Subject.new(name: "Computer Science")
computer_science.save

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


100.times do
  tutor = Tutor.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample,
    phone_number: Faker::PhoneNumber.phone_number,
    currency: [:EUR, :CHF, :USD, :CAD, :JPY, :SEK, :DKK, :GBP].sample,
    price: rand(10...30),
    email: Faker::Internet.email,
    password: '123456'
  )
  tutor.save
  3.times do
    taught_lesson = TaughtLesson.new(
      subject_id: Subject.all.sample.id,
      tutor_id: tutor.id
    )
    taught_lesson.save
  end
  2.times do
    spoken_language = SpokenLanguage.new(
      language_id: Language.all.sample.id,
      tutor_id: tutor.id
    )
    spoken_language.save
  end
end

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

puts 'Finished!'
puts '-----------------------------'

puts 'Creating Bookings...'
# Accepted / Paid
booking1 = Booking.new(student_id: alice.id, tutor_id: pierre.id, subject_id: 2, date: DateTime.new(2020, 01, 21, 14, 0, 0, '+01:00'), duration: 60, booking_price: pierre.price, accepted_at: '2020-01-14', paid_at: '2020-01-17')
booking1.save
# Accepted / Not paid
booking2 = Booking.new(student_id: bob.id, tutor_id: pierre.id, subject_id: 7, date: DateTime.new(2020, 01, 20, 9, 30, 0, '+00:00'), duration: 90, booking_price: pierre.price*1.5, accepted_at: '2020-01-17')
booking2.save
# Canceled
booking3 = Booking.new(student_id: alice.id, tutor_id: pierre.id, subject_id: 3, date: DateTime.new(2020, 01, 06, 11, 00, 0, '+01:00'), duration: 60, booking_price: pierre.price, accepted_at: '2020-01-02', canceled_at: '2020-01-04')
booking3.save
# Not accepted yet
booking4 = Booking.new(student_id: bob.id, tutor_id: pierre.id, subject_id: 7, date: DateTime.new(2020, 01, 24, 18, 00, 0, '+00:00'), duration: 60, booking_price: pierre.price)
booking4.save
# Accepted / Paid / Given
booking5 = Booking.new(student_id: alice.id, tutor_id: pierre.id, subject_id: 2, date: DateTime.new(2020, 01, 16, 22, 00, 0, '+01:00'), duration: 90, booking_price: pierre.price*1.5, accepted_at: '2020-01-13', paid_at: '2020-01-15')
booking5.save
puts 'Finished!'
puts '-----------------------------'
