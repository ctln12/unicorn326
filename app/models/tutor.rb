class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :taught_lessons
  has_many :spoken_languages
  has_many :bookings
  has_one :currency
  has_many :subjects, through: :taught_lessons
  has_many :languages, through: :spoken_languages
  has_many :reviews, through: :bookings
  has_many :wallets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true
  # validates :photo_url, presence: true
  # validates :subjects, presence: true
  # validates :spoken_languages, presence: true
  validates :currency_id, presence: true
  validates :price, presence: true

  after_create :send_welcome_email

  private

  def send_welcome_email
    TutorMailer.with(tutor: self).welcome.deliver_later
  end
end
