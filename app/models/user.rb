class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, :set_admin, on: :create

  mount_uploader :avatar, AvatarUploader

  validates :admin, inclusion: { in: [true, false] }, allow_nil: false

  after_commit :link_subscriptions, on: :create

  after_create :send_email

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
