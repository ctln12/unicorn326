# Preview all emails at http://localhost:3000/rails/mailers/tutor_mailer
class TutorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tutor_mailer/welcome
  def welcome
    tutor = Tutor.last
    TutorMailer.with(tutor: tutor).welcome
  end

end
