class Subscriber < ApplicationRecord
  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :next_payment, presence: true

  def last_payment
    payments.order(payment_date: :desc).first
  end

  def status
    return :expired if next_payment < Date.today
    return :expiring_soon if next_payment <= Date.today + 7
    :active
  end

  def status_label
    case status
    when :active        then "Activo"
    when :expiring_soon then "Por vencer"
    when :expired       then "Vencido"
    end
  end

  def status_color
    case status
    when :active        then "green"
    when :expiring_soon then "orange"
    when :expired       then "red"
    end
  end
end