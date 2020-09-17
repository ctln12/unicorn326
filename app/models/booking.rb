class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  belongs_to :language

  has_many :reviews, dependent: :destroy
  has_one :lesson, dependent: :destroy

  validates :date, :start_time, :end_time, :booking_price, presence: true

  def status
    return {class: 'canceled', message: 'CANCELED'} if self.canceled_at

    if self.paid_at && self.date < Date.today
      {class: 'completed', message: 'COMPLETED'}
    elsif self.paid_at && self.date == Date.today
      {class: 'today', message: 'TODAY'}
    elsif self.paid_at && self.date > Date.today
      {class: 'coming', message: 'COMING SOON'}
    elsif self.accepted_at
      {class: 'unpaid', message: 'PAYMENT PENDING'}
    else
      {class: 'unconfirmed', message: 'CONFIRMATION PENDING'}
    end
  end
end
