class InvoiceItemsController < ApplicationController
  before_action :authorize_user
  before_action :set_invoice
  before_action :set_invoice_item, only: %i[edit update destroy]

  layout 'client'

  def new
    @invoice_item = @invoice.invoice_items.build
  end

  def edit; end

  def create
    @invoice_item = @invoice.invoice_items.build(invoice_item_params)
    if @invoice_item.save
      redirect_to @invoice, notice: 'Invoice item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @invoice_item.update(invoice_item_params)
      redirect_to @invoice, notice: 'Invoice item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @invoice_item.destroy
    redirect_to @invoice, notice: 'Invoice item was successfully deleted.'
  end

  private

  def set_invoice
    @invoice = current_user.invoices.find(params[:invoice_id])
  end

  def set_invoice_item
    @invoice_item = @invoice.invoice_items.find(params[:id])
  end

  def invoice_item_params
    params.require(:invoice_item).permit(:description, :quantity, :amount)
  end

  def authorize_user
    unless current_user
      redirect_to root_path
    end
  end
end
