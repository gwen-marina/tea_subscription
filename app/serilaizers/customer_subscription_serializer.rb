class CustomerSubscriptionSerializer

  class << self 

    def new_subscription(customer_subscription)
      customer = Customer.find(customer_subscription.customer_id)
      subscription = Subscription.find(customer_subscription.subscription_id)
      {
        customer: {
          id: customer.id,
          first_name: customer.first_name,
          last_name: customer.last_name,
          street: customer.street,
          city: customer.city,
          state: customer.state,
          zip_code: customer.zip_code
          },
        subscription: {
          name: subscription.name,
          status: subscription.status,
          price: subscription.price,
          frequency: subscription.frequency,
          }
        }
    end
  end
end