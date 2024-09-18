require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) } # This uses the FactoryBot build method

  describe 'associations' do
    it 'has one cart' do
      expect(user).to respond_to(:cart)
    end

    it 'has many cart items through cart' do
      expect(user).to respond_to(:cart_items)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      create(:user, email: user.email) # Create another user with the same email
      expect(user).to_not be_valid
    end
  end

  describe '#admin?' do
    it 'returns true if user type is admin' do
      user.user_type = 'admin'
      expect(user.admin?).to be_truthy
    end

    it 'returns false if user type is not admin' do
      user.user_type = 'regular'
      expect(user.admin?).to be_falsey
    end
  end
end
