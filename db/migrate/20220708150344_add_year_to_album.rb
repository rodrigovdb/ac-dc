class AddYearToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :year, :integer

    Album.find_by(name: 'High Voltage').update(year: 1976)
    Album.find_by(name: 'Dirty Deeds Done Dirt Cheap').update(year: 1976)
    Album.find_by(name: 'Let There Be Rock').update(year: 1977)
    Album.find_by(name: 'Powerage').update(year: 1978)
    Album.find_by(name: 'Highway to Hell').update(year: 1979)
    Album.find_by(name: 'Back in Black').update(year: 1980)
    Album.find_by(name: 'For Those About to Rock We Salute You').update(year: 1981)
    Album.find_by(name: 'Flick of the Switch').update(year: 1983)
    Album.find_by(name: 'Fly on the Wall').update(year: 1985)
    Album.find_by(name: 'Blow Up Your Video').update(year: 1988)
    Album.find_by(name: 'The Razors Edge').update(year: 1990)
    Album.find_by(name: 'Ballbreaker').update(year: 1995)
    Album.find_by(name: 'Stiff Upper Lip').update(year: 2000)
    Album.find_by(name: 'Black Ice').update(year: 2008)
    Album.find_by(name: 'Rock or Bust').update(year: 2014)
    Album.find_by(name: 'Power Up').update(year: 2020)
  end
end
