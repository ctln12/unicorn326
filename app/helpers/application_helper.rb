module ApplicationHelper

  def average_rating(reviews)
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    average = sum.fdiv(reviews.count).round(2)
  end

  def is_sender?(message)
    message.author == (current_student || current_tutor)
  end

  def is_recipient_student?(chat)
    if student_signed_in?
      Student.exists?(id: chat.tutor.id, first_name: chat.tutor.first_name, last_name: chat.tutor.last_name, email: chat.tutor.email, date_of_birth: chat.tutor.date_of_birth, country: chat.tutor.country)
    else
      Student.exists?(id: chat.student.id, first_name: chat.student.first_name, last_name: chat.student.last_name, email: chat.student.email, date_of_birth: chat.student.date_of_birth, country: chat.student.country)
    end
  end

end
