class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :job_posts
  has_many :chats
  # has_many :reviews, through: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :country, presence: true
  #validates :photo_url, presence: true
  validates :date_of_birth, presence: true

  after_create :send_welcome_email

  private

  def send_welcome_email
    StudentMailer.with(student: self).welcome.deliver_later
  end
end
