class User < ApplicationRecord
    has_secure_password
    # password '123' => password_digest "asldkffjasdf"
    # user.authenticate("123")
    validates :username, uniqueness: { case_sensitive: false }
    
    has_many :trips
    has_many :locations, through: :trips
    has_many :activities, through: :locations

end
