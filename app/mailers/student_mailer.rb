class StudentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.welcome.subject
  #
  def welcome
    @student = params[:student]
    mail to: @student.email, subject: "Welcome to Brainiak.io"
  end
end
