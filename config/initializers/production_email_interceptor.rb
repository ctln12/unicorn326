# to be deleted once production is up and running
if Rails.env.production?
  require "email_interceptor"
  ActionMailer::Base.register_interceptor(EmailInterceptor)
end

