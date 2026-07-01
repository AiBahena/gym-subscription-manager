class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  def index
    @subscribers = Subscriber.all.order(:name)
  end

  def show
    @payments = @subscriber.payments.order(payment_date: :desc)
    @new_payment = Payment.new
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to @subscriber, notice: "Suscriptor creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @subscriber.update(subscriber_params)
      redirect_to @subscriber, notice: "Suscriptor actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriber.destroy
    redirect_to subscribers_path, notice: "Suscriptor eliminado."
  end

  private

  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end

  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :phone, :next_payment)
  end
end