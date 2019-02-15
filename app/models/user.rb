class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[facebook vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, :set_admin, on: :create

  mount_uploader :avatar, AvatarUploader

  validates :admin, inclusion: { in: [true, false] }, allow_nil: false

  after_commit :link_subscriptions, on: :create

  after_create :send_email

  def self.find_for_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider

    if provider == 'facebook'
      id = access_token.extra.raw_info.id
      url = "https://facebook.com/#{id}"
    elsif provider == 'vkontakte'
      url = access_token.info.urls.Vkontakte
    end

    where(url: url, provider: provider).first_or_create! do |user|
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  private

  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

  def set_admin
    self.admin = false
  end

  def send_email
    EventMailer.registration(self).deliver_now
  end
end
