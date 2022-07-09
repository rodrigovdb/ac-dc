# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true

  before_create :define_sort

  # Forces the duration informed as string to be a number
  def duration=(value)
    return unless value.present?

    value = TrackDuration.new(value).seconds

    super(value)
  end

  # Forces the stored number be returned as string
  def duration
    value = super
    return unless value.present?

    TrackDuration.new(value).to_s
  end

  private

  def define_sort
    max_sort = album.songs&.order(sort: :desc)&.first&.sort || 0

    self.sort = max_sort + 1
  end
end
