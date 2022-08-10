import { Injectable } from '@angular/core';
import { Apollo } from 'apollo-angular';
import { Observable } from 'rxjs';

import { Song } from 'src/app/shared';
import CREATE_SONG from 'src/app/graphql/createSong';
import GET_SONG from 'src/app/graphql/getSong';
import UPDATE_SONG from 'src/app/graphql/updateSong';
import DELETE_SONG from 'src/app/graphql/deleteSong';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  constructor(
    private apollo: Apollo
  ) { }

  find(id: number): Observable<any> {
    return this
      .apollo
      .watchQuery<any>({
        query: GET_SONG,
        variables: {
          id: id
        }
      })
      .valueChanges;
  }

  insert(song: Song): Observable<any> {
    return this
      .apollo
      .mutate({
        mutation: CREATE_SONG,
        variables: {
          name: song.name,
          albumId: song.albumId,
          duration: song.duration
        }
      })
  }

  update(song: Song): Observable<any> {
    return this
      .apollo
      .mutate({
        mutation: UPDATE_SONG,
        variables: {
          id: song.id,
          albumId: String(song.albumId),
          name: song.name,
          duration: song.duration
        }
      })
  }

  delete(id: number): Observable<any> {
    return this
      .apollo
      .mutate({
        mutation: DELETE_SONG,
        variables: {
          id: id
        }
      })
  }
}
