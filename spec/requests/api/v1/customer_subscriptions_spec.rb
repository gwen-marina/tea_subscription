require 'rails_helper'

RSpec.describe 'Customer Subscription API' do 

  it 'can subscribe a customer to a tea subscription' do 
    cust_1 = Customer.create!(first_name: 'Tarker', 
                              last_name: 'Thomson', 
                              email: 'imtarker@email.com',
                              street: '1234 Turing Avenue',
                              city: 'Anytown',
                              state: 'Maryland',
                              zip_code: '12345'
                            )

    sub_1 = Subscription.create!(name: 'basic tea', price: 10.00, status: 'active', frequency: 'monthly')
    
    subscription_params = ({customer_id: cust_1.id, subscription_id: sub_1.id})

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/customer_subscriptions", headers: headers, params: JSON.generate(customer_subscriptions: subscription_params)
    created_customer_subscription = CustomerSubscription.last

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response.status).to_not eq(204)
    expect(created_customer_subscription.customer.first_name).to eq(cust_1.first_name)
    expect(created_customer_subscription.subscription.price).to eq(sub_1.price)
  end
end