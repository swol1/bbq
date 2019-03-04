class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[facebook vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  mount_uploader :avatar, AvatarUploader

  validates :admin, inclusion: { in: [true, false] }, allow_nil: false

  after_commit :link_subscriptions, on: :create

  def self.find_for_facebook_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider
    id = access_token.extra.raw_info.id
    url = "https://facebook.com/#{id}"

    where(url: url, provider: provider).first_or_create! do |user|
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  def self.find_for_vkontakte_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider
    url = access_token.info.urls['Vkontakte']

    where(url: url, provider: provider).first_or_create! do |user|
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  private

  def initialize(attrs = {})
    defaults = {
      name: "Товарисч №#{rand(777)}",
      admin: false
    }
    super(defaults.merge(attrs)) unless attrs.nil?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
