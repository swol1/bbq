class Event < ApplicationRecord

  validate  :title, presence: true, length: {maximum: 255}
  validate  :address, presence: true
  validate  :datetime, presence: true
end
