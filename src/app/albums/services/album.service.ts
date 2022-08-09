import { Injectable } from '@angular/core';

import { Album } from 'src/app/shared';

const LS_KEY: string = "albumsLocalStorage";

@Injectable({
  providedIn: 'root'
})
export class AlbumService {

  constructor() { }

    find(id: number): Album | undefined {
      const albums: Album[] = this.list();

      return albums.find(album => album.id === id)
    }

  list(): Album[] {
    const albums = localStorage[LS_KEY];

    return albums ? JSON.parse(albums) : [];
  }

  insert(album: Album): void {
    const albums = this.list();

    album.id = new Date().getTime();
    albums.push(album);

    localStorage[LS_KEY] = JSON.stringify(albums);
  }

  update(album: Album): void {
    const albums = this.list();

    /// override the informed element
    albums.forEach((currentElement, index, elementsList) => {
      if(album.id === currentElement.id) {
        elementsList[index] = album;
      }
    });

    localStorage[LS_KEY] = JSON.stringify(albums);
  }

  delete(id: number): void {
    let albums = this.list();

    /// reject the element with the informed id
    albums = albums.filter(album => album.id !== id)

    localStorage[LS_KEY] = JSON.stringify(albums);
  }

}
