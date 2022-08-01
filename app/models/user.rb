class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, :nickname, presence: true
    validates :password, length: {minimum: 6, allow_nil:  true}
    has_many :books

    before_validation :ensure_session_token

    attr_reader :password 

    def self.find_by_credentials(username, password)
        user = User.find_by(username:)
        if user && user.is_password?(password)
            user
        else 
            nil
        end 
    end 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end 
    
    def is_password?(password)
        bcrypt_obj = BCrypt::Password.new(self.password_digest)
        bcrypt_obj.is_password?(password)
    end 

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end 
        token
    end 

    def reset_session_token
        self.session_token = generate_unique_session_token
        self.save
        self.session_token
    end 

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end 




end
