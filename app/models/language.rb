class Language < ApplicationRecord
  has_many :spoken_languages
  has_many :job_posts
end
