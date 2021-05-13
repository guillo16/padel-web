class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :message, validate: true
  attribute :phone, validate: true
  attribute :nickname, captcha: true

  def headers
    {
      subject: "Mensaje de clientes de cotton home",
      to: "cottonhome.sn@gmail.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
