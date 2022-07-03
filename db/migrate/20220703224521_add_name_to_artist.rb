class AddNameToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :name, :string

    Artist.all.each do |artist|
      artist.update(name: "#{artist.first_name} #{artist.last_name}")
    end
  end
end
