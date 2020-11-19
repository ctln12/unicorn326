class Lesson < ApplicationRecord
  belongs_to :booking

  validates :booking_id, presence: true, uniqueness: true

  before_create :set_opentok_session_id

  private

  def set_opentok_session_id
    opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    session = opentok.create_session(media_mode: :routed)
    self.opentok_session_id = session.session_id
  end
end
