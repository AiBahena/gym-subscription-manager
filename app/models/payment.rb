class Payment < ApplicationRecord
  belongs_to :subscriber

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_date, presence: true

  after_create :update_subscriber

  private

  def update_subscriber
    subscriber.update(
      next_payment: payment_date >> 1,
      active: true
    )
  end
end