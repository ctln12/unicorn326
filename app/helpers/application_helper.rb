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
end
