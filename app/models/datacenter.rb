class Datacenter < ApplicationRecord
  has_many :rooms, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
