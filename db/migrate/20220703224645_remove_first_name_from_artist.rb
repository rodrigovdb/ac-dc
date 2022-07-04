# frozen_string_literal: true

class RemoveFirstNameFromArtist < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :first_name, :string
  end
end
