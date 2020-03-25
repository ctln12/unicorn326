require 'faker'

puts 'Destroying reviews...'
Review.destroy_all

puts 'Destroying job_posts...'
JobPost.destroy_all

puts 'Destroying lessons...'
Lesson.destroy_all

puts 'Destroying bookings...'
Booking.destroy_all

puts 'Destroying taught lessons...'
TaughtLesson.destroy_all

puts 'Destroying subjects...'
Subject.destroy_all

puts 'Destroying spoken languages...'
SpokenLanguage.destroy_all

puts 'Destroying languages...'
Language.destroy_all

puts 'Destroying wallets...'
Wallet.destroy_all

puts 'Destroying chats...'
Chat.destroy_all

puts 'Destroying tutors...'
Tutor.destroy_all

puts 'Destroying students...'
Student.destroy_all

puts 'Destroying currencies...'
Currency.destroy_all

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

puts 'Creating Currencies'

eur = Currency.new(name: "EUR")
eur.save

chf = Currency.new(name: "CHF")
chf.save

usd = Currency.new(name: "USD")
usd.save

nok = Currency.new(name: "NOK")
nok.save

sek = Currency.new(name: "SEK")
sek.save

dkk = Currency.new(name: "DKK")
dkk.save

gbp = Currency.new(name: "GBP")
gbp.save

puts 'Finished!'
puts '-----------------------------'

puts 'Creating Students...'
alice = Student.new(first_name: 'Alice', last_name: 'Needham', country: 'SE', date_of_birth: '2000-05-10', email: 'alice.needham@student.com', password: '123456')
alice.save
bob = Student.new(first_name: 'Bob', last_name: 'Hutchings', country: 'GB', date_of_birth: '1995-10-08', email: 'bob.hutchingsg@student.com', password: '123456')
bob.save

5.times do # 25.times
  fn = Faker::Name.first_name
  ln = Faker::Name.last_name
  student = Student.new(
    first_name: fn,
    last_name: ln,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample,
    email: "#{fn}.#{ln}@student.com",
    password: '123456'
  )
  student.save

end

puts 'Finished'
puts '-----------------------------'

puts 'Creating Tutors...'

pierre = Tutor.new(first_name: 'Pierre', last_name: 'Martin', date_of_birth: '1967-06-20', country: 'FR', phone_number: '33671283384', currency_id: eur.id, price: 25, email: 'pierre.martin@tutor.com', password: '123456')
pierre.save
wallet = Wallet.new(tutor_id: pierre.id, amount: 123.45)
wallet.save

david = Tutor.new(first_name: 'David', last_name: 'Lawson', date_of_birth: '1951-01-24', country: 'GB', phone_number: '44214235689', currency_id: gbp.id, price: 30, email: 'david.lawson@tutor.com', password: '123456')
david.save
wallet = Wallet.new(tutor_id: david.id, amount: 0)
wallet.save

charles = Tutor.new(first_name: 'Charles', last_name: 'Davis', date_of_birth: '1991-04-30', country: 'US', phone_number: '12145096897', currency_id: usd.id, price: 25, email: 'charles.davis@tutor.com', password: '123456')
charles.save
wallet = Wallet.new(tutor_id: charles.id, amount: 0)
wallet.save

john = Tutor.new(first_name: 'John', last_name: 'Kendall', date_of_birth: '1972-12-17', country: 'CA', phone_number: '12267741234', currency_id: usd.id, price: 20, email: 'john.kendall@tutor.com', password: '123456')
john.save
wallet = Wallet.new(tutor_id: john.id, amount: 0)
wallet.save

georges = Tutor.new(first_name: 'Georges', last_name: 'Till', date_of_birth: '1980-02-03', country: 'CH', phone_number: '41786272034', currency_id: chf.id, price: 30, email: 'george.till@tutor.com', password: '123456')
georges.save
wallet = Wallet.new(tutor_id: georges.id, amount: 0)
wallet.save


5.times do #50.times
  fn = Faker::Name.first_name
  ln = Faker::Name.last_name
  tutor = Tutor.new(
    first_name: fn,
    last_name: ln,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    country: [:AF, :SE, :CA, :US, :GB, :FR, :CH].sample,
    phone_number: Faker::PhoneNumber.phone_number,
    currency_id: Currency.all.sample.id,
    price: rand(10...30),
    email: "#{fn}.#{ln}@tutor.com",
    password: '123456'
  )
  tutor.save

  wallet = Wallet.new(tutor_id: tutor.id, amount: 0)
  wallet.save

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

puts 'Creating Post Jobs and Comments ...'

  25.times do
    post = JobPost.new(
      student_id: Student.ids.sample,
      title: Faker::Coffee.blend_name,
      description: Faker::Lorem.paragraph(sentence_count: 15),
      currency_id: Currency.all.sample.id,
      price: rand(10...30),
      subject_id: Subject.all.sample.id,
      language_id: Language.all.sample.id
    )
    post.save
    comment1 = Comment.new(content: Faker::Lorem.paragraph(sentence_count: 15), job_post_id: post.id, tutor_id: Tutor.ids.sample)
    comment1.save
    comment2 = Comment.new(content: Faker::Lorem.paragraph(sentence_count: 15), job_post_id: post.id, tutor_id: Tutor.ids.sample)
    comment2.save
  end

puts 'Finished'
puts '-----------------------------'

puts 'Creating Bookings and Chats...'
# Accepted / Paid / Given
booking1 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: mathematics.id,
  language_id: english.id,
  start_date: DateTime.now - 10.1,
  end_date: DateTime.now - 10.1 + 1.hour,
  booking_price: pierre.price*1.5,
  accepted_at: DateTime.now - 12.3,
  paid_at: DateTime.now - 11.2
)
booking1.save
chat1 = Chat.new(student: booking1.student, tutor: booking1.tutor)
chat1.save
# Accepted / Paid / Not given yet
booking2 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: mathematics.id,
  language_id: english.id,
  start_date: DateTime.now + 1.2,
  end_date: DateTime.now + 1.2 + 1.hour,
  booking_price: pierre.price,
  accepted_at: DateTime.now - 1.1,
  paid_at: DateTime.now
)
booking2.save
chat2 = Chat.new(student: booking2.student, tutor: booking2.tutor)
chat2.save
lesson = Lesson.new(video_url: "video", booking: booking2)
lesson.save!
# Accepted / Not paid
booking3 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: chemistry.id,
  language_id: french.id,
  start_date: DateTime.now + 2.3,
  end_date: DateTime.now + 2.3 + 1.hour,
  booking_price: pierre.price*1.5,
  accepted_at: DateTime.now - 1.2
)
booking3.save
chat3 = Chat.new(student: booking3.student, tutor: booking3.tutor)
chat3.save
# Not accepted yet
booking4 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: chemistry.id,
  language_id: french.id,
  start_date: DateTime.now + 3,
  end_date: DateTime.now + 3 + 1.hour,
  booking_price: pierre.price
)
booking4.save
chat4 = Chat.new(student: booking4.student, tutor: booking4.tutor)
chat4.save
# Canceled by tutor
booking5 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: physics.id,
  language_id: english.id,
  start_date: DateTime.now - 1.4,
  end_date: DateTime.now - 1.4 + 1.hour,
  booking_price: pierre.price,
  canceled_at: DateTime.now - 3.1
)
booking5.save
chat5 = Chat.new(student: booking5.student, tutor: booking5.tutor)
chat5.save
# Accepted / Canceled by student
booking6 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: physics.id,
  language_id: english.id,
  start_date: DateTime.now - 2.5,
  end_date: DateTime.now - 2.5 + 1.hour,
  booking_price: pierre.price,
  accepted_at: DateTime.now - 4.2,
  canceled_at: DateTime.now - 3.1
)
booking6.save
chat6 = Chat.new(student: booking6.student, tutor: booking6.tutor)
chat6.save
# Accepted / Paid / Canceled
booking7 = Booking.new(
  student_id: alice.id,
  tutor_id: pierre.id,
  subject_id: chemistry.id,
  language_id: french.id,
  start_date: DateTime.now - 3.6,
  end_date: DateTime.now - 3.6 + 1.hour,
  booking_price: pierre.price*1.5,
  accepted_at: DateTime.now - 6.3,
  paid_at: DateTime.now - 5.2,
  canceled_at: DateTime.now - 4.1
)
booking7.save
chat7 = Chat.new(student: booking7.student, tutor: booking7.tutor)
chat7.save

5.times do # 50.times
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now - 10.1,
    end_date: DateTime.now - 10.1 + 1.hour,
    booking_price: random_tutor.price*1.5,
    accepted_at: DateTime.now - 12.3,
    paid_at: DateTime.now - 11.2
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
end

3.times do
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now + 1.2,
    end_date: DateTime.now + 1.2 + 1.hour,
    booking_price: random_tutor.price,
    accepted_at: DateTime.now - 1.1,
    paid_at: DateTime.now
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
  lesson = Lesson.new(video_url: "video", booking: booking)
  lesson.save
end

5.times do # 10.times
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now + 2.3,
    end_date: DateTime.now + 2.3 + 1.hour,
    booking_price: random_tutor.price*1.5,
    accepted_at: DateTime.now - 1.2
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
end

3.times do
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now + 3,
    end_date: DateTime.now + 3 + 1.hour,
    booking_price: random_tutor.price
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
end

2.times do
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now - 1.4,
    end_date: DateTime.now - 1.4 + 1.hour,
    booking_price: random_tutor,
    canceled_at: DateTime.now - 3.1
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
end

2.times do
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now - 2.5,
    end_date: DateTime.now - 2.5 + 1.hour,
    booking_price: random_tutor.price,
    accepted_at: DateTime.now - 4.2,
    canceled_at: DateTime.now - 3.1
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
end

2.times do
  random_tutor = Tutor.all.sample
  booking = Booking.new(
    student_id: alice.id,
    tutor_id: random_tutor.id,
    subject_id: random_tutor.subjects.sample.id,
    language_id: random_tutor.languages.sample.id,
    start_date: DateTime.now - 3.6,
    end_date: DateTime.now - 3.6 + 1.hour,
    booking_price: random_tutor.price*1.5,
    accepted_at: DateTime.now - 6.3,
    paid_at: DateTime.now - 5.2,
    canceled_at: DateTime.now - 4.1
  )
  booking.save
  chat = Chat.new(student: booking.student, tutor: booking.tutor)
  chat.save
end

puts 'Finished!'
puts '-----------------------------'
