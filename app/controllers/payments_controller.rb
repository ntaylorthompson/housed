class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json


  def confirm
      @payment = Payment.new(
        :amount => transaction_amount(params[:transactionAmount]),
        :transaction_id     => params[:transactionId]
      )
      if @payment.save
        show= Show.find(params[:referenceId].to_i)
        guest = show.guests.build(payment_id: @payment.id, email: params[:buyerEmail], tickets: (@payment.amount/show.ticket_price).round )
        guest.save
        redirect_to( [show.user, show,guest], :notice => 'Payment was successfully created.')
      else
        redirect_to :action => "index"
      end
    end

#originally, this was in the model... 

    def transaction_amount(currency_and_amount)
      currency = parse(currency_and_amount).first
      if currency == 'USD'
        amount = parse(currency_and_amount).last.to_f
      else
        amount = currency.to_f unless amount == 0.0
      end
#      self.amount = amount 
    end

    def parse(currency_and_amount)
      @parsed ||= currency_and_amount.split
    end







  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params[:payment])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
end
