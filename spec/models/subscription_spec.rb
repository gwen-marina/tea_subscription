require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
    it { should have_many :teas }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
    it { should validate_presence_of :status}
    it { should validate_presence_of :frequency}
  end
end
