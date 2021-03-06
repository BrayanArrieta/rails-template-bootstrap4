class EmailLink < ApplicationRecord
  belongs_to :user
  after_create :send_email

  def self.generate(email)
    user = User.find_by_email(email)
    if user
      create(user: user, expires_at: DateTime.now + 12.hours, token: generate_token)
    else
      return nil
    end
  end

  def self.generate_token
    Devise.friendly_token.first(16)
  end

  private def send_email
    EmailLinkMailer.sign_in_mail(self).deliver_now
  end
end
