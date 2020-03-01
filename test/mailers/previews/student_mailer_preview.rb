# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/welcome
  def welcome
    student = Student.last
    StudentMailer.with(student: student).welcome
  end

end
