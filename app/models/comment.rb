class Comment < ApplicationRecord
  belongs_to :job_post
  belongs_to :tutor
end
