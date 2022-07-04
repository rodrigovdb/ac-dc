# frozen_string_literal: true

class RemoveLastNameFromArtist < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :last_name, :string
  end
end
