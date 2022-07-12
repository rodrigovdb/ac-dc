# frozen_string_literal: true

module Types
  class AlbumType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :year, Int
    field :cover_image, String
    field :total_duration, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :songs, [Types::SongType]

    def total_duration
      seconds = object.songs.map { |song| TrackDuration.new(song.duration).seconds }.inject(:+)

      TrackDuration.new(seconds)
    rescue
      '0:00'
    end
  end
end
