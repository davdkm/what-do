class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  has_many :schedules
  has_many :events, through: :schedules#, source: :event
  has_many :locations, through: :events

  has_many :comments

  validates :name, presence: true

  enum role: [:normal, :moderator, :admin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name || user.auth.info.username
    end
  end

end
