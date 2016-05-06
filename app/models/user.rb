class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable

  has_many :event_users
  has_many :events
  has_many :locations, through: :events

  has_many :comments
end
