class ChargesController < ApplicationController
  def new

  end

  def create
    # Amount in cents
    @item = Item.find(params[:purchase_item])
    @amount = (@item.price * 100).to_i

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

# Currently never being called, but persists as a saftey net for furture updates.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to charges_path
  end
end
