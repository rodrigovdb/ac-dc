import { Component, OnInit } from '@angular/core';
import { Album } from '../interfaces/album';
import {Apollo, gql} from 'apollo-angular';

const GET_ALBUMS = gql`
{
  albums {
    id
    name
    year
    coverImage
    totalDuration
  }
}
`

@Component({
  selector: 'app-albums',
  templateUrl: './albums.component.html',
  styleUrls: ['./albums.component.sass']
})

export class AlbumsComponent implements OnInit {

  albums:Album[] = [];

  selectedAlbum?: Album;

  constructor(private apollo: Apollo) { }

  ngOnInit(): void {
    this.apollo
    .watchQuery({
      query: GET_ALBUMS,
    })
    .valueChanges.subscribe((result: any) => {
      this.albums = result.data.albums
    });
  }

  onSelect(album: Album): void {
    this.selectedAlbum = album;
  }
}