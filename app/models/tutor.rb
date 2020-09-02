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

  after_save :algolia_index!

  include AlgoliaSearch
  algoliasearch per_environment: true do
    attributes :id, :first_name, :last_name, :email
    attribute :price do
      price.round
    end
    attribute :country do
      ISO3166::Country.find_country_by_alpha2(self.country).unofficial_names.first
    end
    attribute :currency do
      currency.name
    end
    attribute :languages do
      languages.map do |s|
        { name: s.name }
      end
    end
    attribute :subjects do
      subjects.map do |s|
        { name: s.name }
      end
    end
    attribute :reviews do
      if reviews.empty?
        { average_rating: 0, reviews_number: 0}
      else
        { average_rating: reviews.map{ |review| review.rating }.sum.fdiv(reviews.length).round(1), reviews_number: reviews.count }
      end
    end
    searchableAttributes ['reviews.average_rating', 'subjects', 'languages', 'country', 'currency', 'first_name', 'last_name', 'price']
    customRanking ['desc(reviews.average_rating)']
    attributesForFaceting ['searchable(subjects.name)', 'searchable(languages.name)', 'searchable(country)', 'currency']
    add_replica 'Tutor_by_price_desc', per_environment: true do
      searchableAttributes ['price']
      customRanking ['desc(price)']
    end
    add_replica 'Tutor_by_price_asc', per_environment: true do
      searchableAttributes ['price']
      customRanking ['asc(price)']
    end
  end

  private

  def send_welcome_email
    TutorMailer.with(tutor: self).welcome.deliver_later
  end
end
