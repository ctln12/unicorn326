class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  belongs_to :language

  has_many :reviews, dependent: :destroy
  has_one :lesson, dependent: :destroy

  validates :date, :start_time, :end_time, :booking_price, presence: true

  def status
    return {class: 'canceled', message: 'CANCELED', action: "/tutors/#{tutor.id}/bookings/new"} if self.canceled_at

    if self.paid_at && self.date < Date.today
      {class: 'completed', message: 'COMPLETED', action: '#'}
    elsif self.paid_at && self.date == Date.today
      {class: 'today', message: 'TODAY', action: "/bookings/#{id}/lessons"}
    elsif self.paid_at && self.date > Date.today
      {class: 'coming', message: 'COMING SOON'}
    elsif self.accepted_at
      {class: 'unpaid', message: 'PAYMENT PENDING', action: "/bookings/#{id}/pay"}
    else
      {class: 'unconfirmed', message: 'CONFIRMATION PENDING', action: "/bookings/#{id}/accept"}
    end
  end
end
