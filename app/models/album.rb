# frozen_string_literal: true

class Album < ApplicationRecord
  has_many :songs, -> { order(:sort) }

  validates :name, presence: true
  validates :cover_image, presence: true
end
