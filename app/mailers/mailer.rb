class Mailer < ActionMailer::Base
  default from: 'www.ablys.org'

  def welcome(recipient)
    @recipient = recipient
    mail(to: recipient,
         subject: "[Signed up] Welcome #{recipient}")
  end
end