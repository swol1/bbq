require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Sign up' do
    it 'is valid' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'returns inputed name' do
      user = FactoryBot.build(:user, name: 'Vasya')
      user.send(:set_name)
      expect(user.name).to eq('Vasya')
    end

    it 'returns random name when it is blank' do
      user = FactoryBot.build(:user, name: nil)
      user.send(:set_name)
      expect(user.name).to include('Товарисч')
    end

    it 'is not admin' do
      user = FactoryBot.build(:user, admin: nil)
      user.send(:set_admin)
      expect(user.admin).to be false
    end

  end

  context 'Subscription' do
    let(:user) { FactoryBot.build(:user, id: 5, email: 'myemail@gmail.com') }
    let!(:subscription) { FactoryBot.create(:subscription, id: 1, user_id: user.id,
                                            user_name: user.name, user_email: user.email) }

    it 'is updated on created user' do
      expect(user.subscriptions.count).to eq(1)
    end
  end
end
