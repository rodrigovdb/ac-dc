# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true

  before_create :define_sort

  private

  def define_sort
    max_sort = album.songs&.order(sort: :desc)&.first&.sort || 0

    self.sort = max_sort + 1
  end
end
