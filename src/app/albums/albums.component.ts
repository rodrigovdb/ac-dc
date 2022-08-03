import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { Apollo } from 'apollo-angular';

import { Album } from '../interfaces/album';
import { Song } from '../interfaces/song';
import GET_ALBUMS from '../graphql/getAlbums';

@Component({
  selector: 'app-albums',
  templateUrl: './albums.component.html',
  styleUrls: ['./albums.component.scss']
})

export class AlbumsComponent implements OnInit {
  loading: boolean = false;
  albums:Album[] = [];
  selectedAlbum?: Album;
  songs:Song[] = [];

  constructor(private apollo: Apollo) { }

  ngOnInit(): void {
    this.apollo.watchQuery<any>({ query: GET_ALBUMS })
      .valueChanges
      .subscribe(({ data, loading }) => {
        this.loading = loading;
        this.albums = data.albums;
      });
  }

  onSelect(album: Album): void {
    this.selectedAlbum = album;
    this.songs = album.songs;
  }
}