# frozen_string_literal: true

module Types
  class SongType < Types::BaseObject
    field :id, ID, null: false
    field :album, Types::AlbumType, null: false
    field :album_id, Int
    field :name, String
    field :sort, Int
    field :duration, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def duration
      return unless object.duration.present?

      TrackDuration.new(object.duration)
    end
  end
end
