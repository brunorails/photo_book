class ContactForm < MailForm::Base
  attribute :name, :subject, :message, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attribute :message
  attribute :nickname, captcha: true

  def headers
    {
      to: Settings.email,
      from: %("#{name}" <#{email}>)
    }
  end
end
