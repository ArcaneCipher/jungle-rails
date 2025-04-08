class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by("LOWER(email) = ?", email.strip.downcase)
    (user && user.authenticate(password)) ? user : nil
  end

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
end
