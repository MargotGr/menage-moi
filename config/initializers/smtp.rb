ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: ENV['POSTMARK_API_KEY'],
  password: ENV['POSTMARK_API_TOKKEN'],
  authentication: :login,
  enable_starttls_auto: true
}
