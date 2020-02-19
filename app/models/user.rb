class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  has_many :organised_events, foreign_key: 'admin_id', class_name: "Event"
       
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
