class User < ActiveRecord::Base

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, uniqueness: true
  
  after_initialize :ensures_session_token
  
  attr_reader :password
  
  has_many(
    :comments,
    class_name: "Comments",
    primary_key: :id,
    foreign_key: :user_id
  )
  
  def self.new_guest
    user = User.new({
      username: "guest_#{Time.now.to_i}_#{rand(99)}",
      guest: true,
      password: "guest." # 6 character minimum.
    })
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(:username => username)
    
    return nil if user.nil?
    
    return user if user.valid_password? (password)
    
    nil
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end
  
  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def ensures_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
