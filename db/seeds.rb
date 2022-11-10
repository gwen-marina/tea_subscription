# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Tea.destroy_all
SubscriptionTea.destroy_all
CustomerSubscription.destroy_all
Subscription.destroy_all

customer_1 = Customer.create!(first_name: 'Eandace', 
                              last_name: 'Cckels', 
                              email: 'iameandace@email.com',
                              street: '1234 Turing Avenue',
                              city: 'Anytown',
                              state: 'Colorado',
                              zip_code: '34567'
                            )
customer_2 = Customer.create!(first_name: 'Dhirley', 
                              last_name: 'Secesari', 
                              email: 'iamdhirley@email.com',
                              street: '1234 Turing Avenue',
                              city: 'Anytown',
                              state: 'Nevada',
                              zip_code: '23456'
                            )
customer_3 = Customer.create!(first_name: 'Tarker', 
                              last_name: 'Thomson', 
                              email: 'imtarker@email.com',
                              street: '1234 Turing Avenue',
                              city: 'Anytown',
                              state: 'Maryland',
                              zip_code: '12345'
                            )

tea_1 = Tea.create!(name: 'green tea', description: 'mild', temperature: 140, brew_time: '2 minutes')
tea_2 = Tea.create!(name: 'black tea', description: 'strong', temperature: 180, brew_time: '3 minutes')
tea_3 = Tea.create!(name: 'mint tea', description: 'minty', temperature: 160, brew_time: '4 minutes')

sub_1 = Subscription.create!(name: 'basic tea', price: 10.00, status: 'active', frequency: 'monthly')
sub_2 = Subscription.create!(name: 'fancy tea', price: 20.00, status: 'canceled', frequency: 'weekly')
sub_3 = Subscription.create!(name: 'all the tea', price: 50.00, status: 'active', frequency: 'monthly')

tea_sub1 = SubscriptionTea.create!(tea_id: tea_1.id, subscription_id: sub_1.id)
tea_sub2 = SubscriptionTea.create!(tea_id: tea_2.id, subscription_id: sub_2.id)
tea_sub3 = SubscriptionTea.create!(tea_id: tea_3.id, subscription_id: sub_3.id)

cust_sub1 = CustomerSubscription.create!(customer_id: customer_1.id, subscription_id: sub_1.id)
cust_sub2 = CustomerSubscription.create!(customer_id: customer_2.id, subscription_id: sub_2.id)
cust_sub3 = CustomerSubscription.create!(customer_id: customer_3.id, subscription_id: sub_3.id)
cust_sub4 = CustomerSubscription.create!(customer_id: customer_3.id, subscription_id: sub_3.id)