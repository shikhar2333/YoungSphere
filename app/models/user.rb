class User < ApplicationRecord
    validates :name,  presence: true, length: { minimum:4, maximum: 50 }
    VALID_EMAIL_REGEX = /\A^[\w+-\.]+@([\w+-]+\.)+[\w-]{2,4}\z/
    validates :email,  presence: true, length: { maximum: 255 },
                       format: {with: VALID_EMAIL_REGEX}
end
