class Contact < MailForm::Base
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :first_name, validate: true
  attribute :last_name, validate: true
  attribute :message, validate: true
  attribute :nickname, captcha: true
  attribute :phone, validate: true

  def headers
    {
      subject: "Mensaje de clientes de cotton home",
      to: "cottonhome.sn@gmail.com",
      from: %("#{self.full_name}" <#{email}>)
    }
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
