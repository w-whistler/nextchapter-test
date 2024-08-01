class InvoicesController < ApplicationController
  before_action :authorize_user
  before_action :set_invoice, only: %i[show edit update destroy]

  layout 'client'

  def index
    @invoices = current_user.invoices.includes(payment_schedule: :payments)

    @invoices = @invoices.map do |invoice|
      payment_schedule = invoice.payment_schedule
      next_payment = payment_schedule&.payments&.where('payment_date > ?', Time.current)&.order('payment_date ASC')&.first
      invoice.instance_variable_set(:@next_payment_date, next_payment&.payment_date)
      invoice
    end
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)
    @invoice.invoice_number = next_invoice_number(current_user)

    if @invoice.save
      redirect_to @invoice, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @invoice.update(invoice_params)
      redirect_to @invoice, notice: 'Invoice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path, notice: 'Invoice was successfully deleted.'
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    puts params
    params.require(:invoice).permit(:client_name)
  end

  def authorize_user
    unless current_user
      redirect_to root_path
    end
  end

  def next_invoice_number(user)
    last_invoice = user.invoices.order(invoice_number: :desc).first
    last_invoice ? last_invoice.invoice_number + 1 : 1
  end
end
