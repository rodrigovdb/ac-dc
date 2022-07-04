# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true
end
