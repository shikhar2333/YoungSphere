# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  locked_at              :datetime
#  name                   :string           default(""), not null
#  provider               :string(50)       default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string(500)      default(""), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable,
           :omniauthable,
           :jwt_authenticatable,
           jwt_revocation_strategy: JwtDenylist,
           omniauth_providers: [:facebook, :github, :google_oauth2, :twitter]

    has_many :scenarios
    has_many :scan_images
    has_one_attached :avatar
    def self.create_from_provider_data(provider_data)
        puts provider_data
        where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
            user.email = provider_data.info.email
            user.name = provider_data.info.name
            user.password = Devise.friendly_token[0, 20]
            require 'open-uri'
            downloaded_image = open(provider_data.info.image)
            user.avatar.attach(io: downloaded_image, filename: 'avatar.jpg', content_type: downloaded_image.content_type)
            user.skip_confirmation!
        end
    end
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
