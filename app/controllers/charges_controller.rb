class ChargesController < ApplicationController

	def new
	  @tool = Tool.find(params[:tool_id])
	  @amount = @tool.rent_price * 100
	end

	def create
	  @tool = Tool.find(params[:tool_id])
	  @amount = @tool.rent_price * 100

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

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

	private

	def tool_params
		params.require(:tool).permit(:name, :description, :user_id, :tool_image, :rent_price)
	end

end
