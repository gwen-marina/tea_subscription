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

    post "/api/v1/subscribe", headers: headers, params: JSON.generate(customer_subscriptions: subscription_params)
    created_customer_subscription = CustomerSubscription.last

    customer_response = JSON.parse(response.body, symbolize_names: true)
   
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response.status).to_not eq(204)

    expect(customer_response[:customer][:first_name]).to eq(cust_1.first_name)
    expect(customer_response[:subscription][:price]).to eq(sub_1.price)
  end

  it 'can cancel a customer tea subscription' do  
    cust_1 = Customer.create!(first_name: 'Dhirley', 
                              last_name: 'Secesari', 
                              email: 'iamdhirley@email.com',
                              street: '1234 Turing Avenue',
                              city: 'Anytown',
                              state: 'Nevada',
                              zip_code: '23456'
                            )

    sub_1 = Subscription.create!(name: 'basic tea', price: 10.00, status: 'active', frequency: 'monthly')

    cust_sub = CustomerSubscription.create!(customer_id: cust_1.id, subscription_id: sub_1.id)

    subscription_params = ({customer_id: cust_1.id, subscription_id: sub_1.id, status: 'canceled'})

    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/unsubscribe", headers: headers, params: JSON.generate(customer_subscriptions: subscription_params)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.status).to_not eq(201)   
  end

  it 'can show all a customers subscriptions active and canceled' do 
    cust_1 = Customer.create!(first_name: 'Eandace', 
                              last_name: 'Cckels', 
                              email: 'iameandace@email.com',
                              street: '1234 Turing Avenue',
                              city: 'Anytown',
                              state: 'Colorado',
                              zip_code: '34567'
                            )

    sub_1 = Subscription.create!(name: 'basic tea', price: 10.00, status: 'active', frequency: 'monthly')
    sub_2 = Subscription.create!(name: 'fancy tea', price: 20.00, status: 'canceled', frequency: 'weekly')
    sub_3 = Subscription.create!(name: 'all the tea', price: 50.00, status: 'active', frequency: 'monthly')

    cust_sub1 = CustomerSubscription.create!(customer_id: cust_1.id, subscription_id: sub_1.id)
    cust_sub2 = CustomerSubscription.create!(customer_id: cust_1.id, subscription_id: sub_2.id)
    cust_sub3 = CustomerSubscription.create!(customer_id: cust_1.id, subscription_id: sub_3.id)


    headers = {"CONTENT_TYPE" => "application/json"}

    get "/api/v1/customers/#{cust_1.id}/subscriptions"

    sub_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.status).to_not eq(400)
    expect(sub_response[:data][:subscriptions].count).to eq(3)
  end
end