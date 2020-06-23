class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
    has_many :scenarios
    # before_save { self.email = self.email.downcase }
    # validates :name,  presence: true, length: { minimum:4, maximum: 50 }
    # VALID_EMAIL_REGEX = /\A[\w+-\.]+@([\w+-]+\.)+[\w-]{2,4}\z/
    # validates :email,  presence: true, length: { maximum: 255 },
    #                    format: {with: VALID_EMAIL_REGEX},
    #                    uniqueness: true
    # has_secure_password
    # VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/
    # validates :phone_number, length:{maximum: 10}, format: {with: VALID_PHONE_REGEX}
end
