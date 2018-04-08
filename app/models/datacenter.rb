class Datacenter < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
