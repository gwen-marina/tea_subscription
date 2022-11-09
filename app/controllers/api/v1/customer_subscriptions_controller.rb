class Api::V1::CustomerSubscriptionsController < ApplicationController 

  def create
    customer_subscription = CustomerSubscription.new(cust_subscription_params) 
    if customer_subscription.save
      render status: 201
    else
      render status: 400
    end
  end

   def destroy 
    customer_subscription = CustomerSubscription.find_by(cust_subscription_params)
    customer_subscription.destroy
    render status: 204
  end

    private

  def cust_subscription_params
    params.require(:customer_subscriptions).permit(:customer_id, :subscription_id)
  end
end