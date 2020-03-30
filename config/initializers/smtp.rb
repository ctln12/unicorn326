ActionMailer::Base.smtp_settings = {
  domain: 'https://unicorn-326.herokuapp.com/',
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  user_name: ENV['USERNAME_SENDGRID'],
  password: ENV['PASSWORD_SENDGRID']
}
