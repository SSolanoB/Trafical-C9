class User < ApplicationRecord
  attr_accessor :track_token
  has_many :calories, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_track_digest
    self.track_token = User.new_token
    update_attribute(:track_digest, User.digest(track_token))
  end

  def send_track_user_email(email)
    TrackMailer.track_progress(self, email).deliver_now
  end

end
