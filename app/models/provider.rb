class Provider < ApplicationRecord
  has_many :contacts, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
