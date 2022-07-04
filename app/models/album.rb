# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist

  validates :name, presence: true
  validates :cover_image, presence: true
end
