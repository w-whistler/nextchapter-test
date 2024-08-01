class PaymentSchedulesController < ApplicationController
  before_action :authorize_user
  before_action :set_invoice
  before_action :set_payment_schedule, only: %i[edit update]

  layout 'client'

  def new
    @payment_schedule = @invoice.build_payment_schedule
  end

  def create
    @payment_schedule = @invoice.build_payment_schedule(payment_schedule_params)
    if @payment_schedule.save
      redirect_to @invoice, notice: 'Payment schedule was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @payment_schedule.update(payment_schedule_params)
      redirect_to @invoice, notice: 'Payment schedule was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def set_payment_schedule
    @payment_schedule = @invoice.payment_schedule
  end

  def payment_schedule_params
    params.require(:payment_schedule).permit(:payment_frequency, :payment_amount, :start_date)
  end

  def authorize_user
    unless current_user
      redirect_to root_path
    end
  end
end
