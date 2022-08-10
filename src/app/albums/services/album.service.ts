import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Apollo } from 'apollo-angular';

import { Album } from 'src/app/shared';
import GET_ALBUMS from 'src/app/graphql/getAlbums';
import GET_ALBUM from 'src/app/graphql/getAlbum';
import CREATE_ALBUM from 'src/app/graphql/createAlbum';
import DELETE_ALBUM from 'src/app/graphql/deleteAlbum';

const LS_KEY: string = "albumsLocalStorage";

@Injectable({
  providedIn: 'root'
})
export class AlbumService {

  constructor(
    private apollo: Apollo
  ) { }

  find(id: number): Observable<any> {
    return this
      .apollo
      .watchQuery<any>({
        query: GET_ALBUM,
        variables: {
          id: id
        }
      })
      .valueChanges;
  }

  list(): Observable<any> {
    return this
      .apollo
      .watchQuery<any>({
        query: GET_ALBUMS
      })
      .valueChanges;
  }

  insert(album: Album): Observable<any> {
    return this
      .apollo
      .mutate({
        mutation: CREATE_ALBUM,
        variables: {
          name: album.name,
          year: album.year,
          coverImage: album.coverImage
        }
      })
  }

  delete(id: number): Observable<any> {
    return this
      .apollo
      .mutate({
        mutation: DELETE_ALBUM,
        variables: {
          id: id
        }
      })
  }

  findFromStorage(id: number): Album | undefined {
    const albums: Album[] = this.listFromStorage();

    return albums.find(album => album.id == id)
  }

  listFromStorage(): Album[] {
    const albums = localStorage[LS_KEY];

    return albums ? JSON.parse(albums) : [];
  }

  insertToStorage(album: Album): void {
    const albums = this.listFromStorage();

    album.id = new Date().getTime();
    albums.push(album);

    localStorage[LS_KEY] = JSON.stringify(albums);
  }

  update(album: Album): void {
    const albums = this.listFromStorage();

    /// override the informed element
    albums.forEach((currentElement, index, elementsList) => {
      if(album.id === currentElement.id) {
        elementsList[index] = album;
      }
    });

    localStorage[LS_KEY] = JSON.stringify(albums);
  }
}
