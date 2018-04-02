class Contact < ApplicationRecord
  belongs_to :provider

  validates :name, presence: true
end
