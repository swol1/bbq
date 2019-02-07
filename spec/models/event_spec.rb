require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations check' do
    it { should validate_presence_of :user }
    it { should validate_presence_of :title }
    it { should validate_presence_of :address }
    it { should validate_presence_of :datetime }

    it { should validate_length_of(:title).is_at_most(255) }
  end

  let(:user) { FactoryBot.create(:user, id: 5) }
  let(:event) { FactoryBot.create(:event, user: user) }


end
