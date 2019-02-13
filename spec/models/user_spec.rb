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

  describe '.find_for_facebook_oauth' do
    let(:access_token) do
      double(
        :access_token,
        provider: 'facebook',
        info: double(email: 'den.gavrilin1@gmail.com'),
        extra: double(raw_info: double(id: '10213477015136709'))
      )
    end

    context 'when user is not found' do
      it 'returns newly created user' do
        user = User.find_for_facebook_oauth(access_token)

        expect(user).to be_persisted
        expect(user.email).to eq 'den.gavrilin1@gmail.com'
      end
    end

    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: 'den.gavrilin1@gmail.com') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_oauth(access_token)).to eq existing_user
      end
    end

    context 'when user is found by provider & url' do
      let!(:existing_user) do
        create(:user, provider: 'facebook',
               url: 'https://facebook.com/10213477015136709')
      end
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_oauth(access_token)).to eq existing_user
      end
    end
  end
end
