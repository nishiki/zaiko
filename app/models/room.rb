class Room < ApplicationRecord
  belongs_to :datacenter

  validates :name, presence: true
end
