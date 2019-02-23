class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions

  validates :name, presence: true, length: { maximum: 35 }
  
  mount_uploader :avatar, AvatarUploader

  validates :admin, inclusion: { in: [true, false] }, allow_nil: false

  after_commit :link_subscriptions, on: :create

  private
  def initialize(attrs = {})
    defaults = {
      name: "Товарисч №#{rand(777)}",
      admin: false
    }
    super(defaults.merge(attrs))
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
