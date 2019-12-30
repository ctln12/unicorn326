class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  #validates :country, presence: true
  validates :date_of_birth, presence: true
  #validates :photo_url, presence: true
end
