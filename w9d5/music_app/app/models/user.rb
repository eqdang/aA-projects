class User < ApplicationRecord
   attr_reader :password

   validates :email, uniqueness: true, presence: true
   validates :password, length: {minimum: 6, allow_nil: true}
   validates :session_token, presence: true

   before_validation :ensure_session_token

   def find_by_credentials(email, pw)
      user = user.find_by(email: email)
      return nil if user.nil?

      user.is_password?(pw) ? user : nil
   end

   def self.generate_session_token
         SecureRandom.urlsafe_base64(16)
   end

   def self.reset_session_token!
      self.session_token = SecureRandom.urlsafe_base64(16)
      self.save!
      self.session_token
   end

   def password=(pw)
      @password = pw
      self.password_digest = BCrypt::Password.create(pw)
   end

   def is_password?(pw)
      BCrypt::Password.new(self.password_digest).is_password?(pw)
   end

   private
   def ensure_session_token
      self.session_token ||= SecureRandom.urlsafe_base64(16)
   end
end
# == Schema Information
#
# Table name: users
#
#  id              :integer(8)      not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

# == Schema Information
#
# Table name: users
#
#  id              :integer(8)      not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

