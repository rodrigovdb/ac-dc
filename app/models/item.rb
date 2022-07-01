class Item < ApplicationRecord
  belongs_to :artist

  validates :title, presence: true, uniqueness: true
end
