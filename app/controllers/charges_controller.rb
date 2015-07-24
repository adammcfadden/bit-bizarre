class ChargesController < ApplicationController
  def new

  end

  def create
    # Amount in cents
    @amount = (current_user.cart.calc_cost * 100).to_i

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
    flash[:notice] = "Thank you for your purchase"
    current_user.cart = Cart.new
    redirect_to root_path
# Currently never being called, but persists as a saftey net for furture updates.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to charges_path
  end
end
