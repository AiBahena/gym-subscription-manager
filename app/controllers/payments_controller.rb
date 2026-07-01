class PaymentsController < ApplicationController
  before_action :set_subscriber

  def new
    @payment = Payment.new
  end

  def create
    @payment = @subscriber.payments.build(payment_params)
    if @payment.save
      redirect_to @subscriber, notice: "Pago registrado correctamente."
    else
      redirect_to @subscriber, alert: "Error al registrar el pago."
    end
  end

  def destroy
    @payment = @subscriber.payments.find(params[:id])
    @payment.destroy
    redirect_to @subscriber, notice: "Pago eliminado."
  end

  private

  def set_subscriber
    @subscriber = Subscriber.find(params[:subscriber_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :payment_date, :notes)
  end
end