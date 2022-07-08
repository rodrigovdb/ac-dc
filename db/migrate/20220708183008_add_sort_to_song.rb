class AddSortToSong < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :sort, :integer

    Album.all.each do |album|
      sort = 1
      album.songs.order(:id).each do |song|
        song.update(sort: sort)

        sort += 1
      end
    end
  end
end
