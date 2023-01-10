class User < ApplicationRecord
    # makes a password hash
    has_secure_password
end
