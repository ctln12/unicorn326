module ApplicationHelper
  def is_sender?(message)
    author_of(message) == (current_student || current_tutor)
  end

  def author_of(message)
    if message.is_student
      Student.find(message.author_id)
    else
      Tutor.find(message.author_id)
    end
  end

  def is_recipient_student?(chat)
    if student_signed_in?
      Student.exists?(id: chat.tutor.id, first_name: chat.tutor.first_name, last_name: chat.tutor.last_name, email: chat.tutor.email, date_of_birth: chat.tutor.date_of_birth, country: chat.tutor.country)
    else
      Student.exists?(id: chat.student.id, first_name: chat.student.first_name, last_name: chat.student.last_name, email: chat.student.email, date_of_birth: chat.student.date_of_birth, country: chat.student.country)
    end
  end
end
