class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :job_posts
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :country, presence: true
  #validates :photo_url, presence: true
  validates :date_of_birth, presence: true
end
