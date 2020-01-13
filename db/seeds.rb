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

philosophy = Subject.new(name: "Phylosophy")
philosophy.save

statistics = Subject.new(name: "Statistics")
statistics.save

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
puts 'Finished!'
puts '-----------------------------'

puts 'Creating Taught Lessons...'
taughtlesson1 = TaughtLesson.new(subject_id: 2, tutor_id: 1)
taughtlesson1.save
taughtlesson2 = TaughtLesson.new(subject_id: 3, tutor_id: 1)
taughtlesson2.save
taughtlesson3 = TaughtLesson.new(subject_id: 7, tutor_id: 1)
taughtlesson3.save
taughtlesson4 = TaughtLesson.new(subject_id: 2, tutor_id: 2)
taughtlesson4.save
taughtlesson5 = TaughtLesson.new(subject_id: 4, tutor_id: 2)
taughtlesson5.save
taughtlesson6 = TaughtLesson.new(subject_id: 2, tutor_id: 3)
taughtlesson6.save
taughtlesson7 = TaughtLesson.new(subject_id: 8, tutor_id: 3)
taughtlesson7.save
taughtlesson8 = TaughtLesson.new(subject_id: 9, tutor_id: 3)
taughtlesson8.save
taughtlesson9 = TaughtLesson.new(subject_id: 2, tutor_id: 4)
taughtlesson9.save
taughtlesson10 = TaughtLesson.new(subject_id: 10, tutor_id: 4)
taughtlesson10.save
taughtlesson11 = TaughtLesson.new(subject_id: 2, tutor_id: 5)
taughtlesson11.save
puts 'Finished!'
puts '-----------------------------'

puts 'Creating Spoken Languages...'
spoken1 = SpokenLanguages.new(language_id: 1, tutor_id: 1)
spoken1.save
spoken2 = SpokenLanguages.new(language_id: 3, tutor_id: 1)
spoken2.save
spoken3 = SpokenLanguages.new(language_id: 1, tutor_id: 2)
spoken3.save
spoken4 = SpokenLanguages.new(language_id: 3, tutor_id: 2)
spoken4.save
spoken5 = SpokenLanguages.new(language_id: 1, tutor_id: 3)
spoken5.save
spoken6 = SpokenLanguages.new(language_id: 3, tutor_id: 3)
spoken6.save
spoken7 = SpokenLanguages.new(language_id: 1, tutor_id: 4)
spoken7.save
spoken8 = SpokenLanguages.new(language_id: 3, tutor_id: 4)
spoken8.save
spoken9 = SpokenLanguages.new(language_id: 1, tutor_id: 5)
spoken9.save
spoken10 = SpokenLanguages.new(language_id: 4, tutor_id: 5)
spoken10.save
puts 'Finished!'
puts '-----------------------------'
