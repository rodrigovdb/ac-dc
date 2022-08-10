import { Injectable } from '@angular/core';
import { Apollo } from 'apollo-angular';
import { Observable } from 'rxjs';
import CREATE_SONG from 'src/app/graphql/createSong';
import { Song } from 'src/app/shared';

@Injectable({
  providedIn: 'root'
})
export class SongService {

  constructor(
    private apollo: Apollo
  ) { }

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
}
