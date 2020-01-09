class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
  validates :currency, presence: true
  validates :price, presence: true
end
