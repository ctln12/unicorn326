class TutorMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.tutor_mailer.welcome.subject
  #
  def welcome
    @tutor = params[:tutor]
    mail to: @tutor.email, subject: "Welcome to Brainiak.io"
  end
end
