class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :taught_lessons
  has_many :spoken_languages
  has_many :bookings
  belongs_to :currency
  has_many :subjects, through: :taught_lessons
  has_many :languages, through: :spoken_languages
  has_many :reviews, through: :bookings
  has_many :wallets
  has_many :chats

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

  include AlgoliaSearch
  algoliasearch do
    attributes :id, :first_name, :last_name, :email, :price
    attribute :country do
      ISO3166::Country.find_country_by_alpha2(self.country).unofficial_names.first
    end
    attribute :currency do
      currency.name
    end
    attribute :languages do
      languages.select { |s| s }.map do |s|
        { name: s.name }
      end
    end
    attribute :subjects do
      subjects.select { |s| s }.map do |s|
        { name: s.name }
      end
    end
    attribute :average_rating do
      if reviews.empty?
        0
      else
        reviews.map{ |review| review.rating }.sum.fdiv(reviews.length).round(1)
      end
    end
    searchableAttributes ['average_rating', 'subjects', 'languages', 'country', 'price', 'currency', 'unordered(first_name)', 'unordered(last_name)']
    customRanking ['desc(reviews)']
  end

  private

  def send_welcome_email
    TutorMailer.with(tutor: self).welcome.deliver_later
  end
end
